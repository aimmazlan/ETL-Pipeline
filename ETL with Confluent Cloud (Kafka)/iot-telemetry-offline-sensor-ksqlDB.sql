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

