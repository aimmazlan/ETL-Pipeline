-- Create a source connector to PostgreSQL
CREATE SOURCE CONNECTOR IF NOT EXISTS iot_telemetry WITH (
  'connector.class'          = 'PostgresSource',
  'name'                     = 'postgres-iot_telemetry',
  'kafka.api.key'            = '<kafka-api-key>',
  'kafka.api.secret'         = '<kafka-api-secret>',
  'connection.host'          = '<database-host>',
  'connection.port'          = '5432',
  'connection.user'          = 'postgres',
  'connection.password'      = '<database-password>',
  'db.name'                  = '<db-name>',
  'table.whitelist'          = 'iot_telemetry',
  'timestamp.column.name'    = 'created_at',
  'output.data.format'       = 'JSON',
  'db.timezone'              = 'UTC',
  'tasks.max'                = '1'
);

SET 'auto.offset.reset' = 'earliest';

-- Create a stream for raw telemetry data
CREATE STREAM iot_telemetry (
  device_id INT,
  ts BIGINT
) WITH (
  KAFKA_TOPIC = 'iot_telemetry',
  VALUE_FORMAT = 'JSON',
  PARTITIONS = 6,
  TIMESTAMP = 'ts'
);

-- Create a table for lags per device over tumbling window
CREATE TABLE iot_telemetry_lags WITH (KAFKA_TOPIC = 'iot_telemetry_lags') AS
SELECT
  device_id,
  WINDOWEND - LATEST_BY_OFFSET(ts) as lag_ms,
  TIMESTAMPTOSTRING(WINDOWSTART, 'yyyy-MM-dd HH:mm:ss') as window_start,
  TIMESTAMPTOSTRING(WINDOWEND, 'yyyy-MM-dd HH:mm:ss') as window_end
FROM iot_telemetry
WINDOW TUMBLING (SIZE 120 SECONDS)
GROUP BY device_id;

-- Create a failed device table with desired threshold
CREATE TABLE failed_devices WITH (KAFKA_TOPIC = 'failed_devices') AS
SELECT device_id FROM iot_telemetry_lags WHERE lag_ms > 6000;

-- Create a sink connector to BigQuery
CREATE SINK CONNECTOR IF NOT EXISTS failed_devices_sink WITH (
    'connector.class' = 'io.confluent.connect.bigquery.BigQuerySinkConnector',
    'key.converter' = 'org.apache.kafka.connect.storage.StringConverter',
    'value.converter' = 'org.apache.kafka.connect.json.JsonConverter',
    'confluent.topic.bootstrap.servers' = 'PLAINTEXT://localhost:9092',
    'confluent.topic.replication.factor' = '1',
    'bigquery.project.id' = '<your-project-id>',
    'bigquery.dataset' = '<your-dataset>',
    'bigquery.table' = 'failed_devices',
    'bigquery.create.disposition' = 'CREATE_IF_NEEDED',
    'bigquery.write.disposition' = 'WRITE_APPEND',
    'flush.size' = '3'
);


