&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![last-commit](https://img.shields.io/github/last-commit/aimmazlan/etl-pipeline)
![commit-activity](https://img.shields.io/github/commit-activity/w/aimmazlan/etl-pipeline)

<p align="center"><img src="https://github.com/aimmazlan/ETL-Pipeline/blob/main/IMG/Real-Time_ETL_with_Kafka.png" alt="ETL-PIPELINE" /></p>

## <p align="center"> Identify Malfunctioning Sensor via IoT data


## Overview
Seamlessly streaming IoT sensor data in real-time from a manufacturing facility straight into a database, utilizing Apache Kafka and the ksqlDB application in Confluent Cloud. Analyze the device telemetry data with ease and load the results into BigQuery for in-depth insights.
 

## Prerequisites
- A Confluent Cloud Account (sign up [here](https://login.confluent.io/login?state=hKFo2SA0MzNHd0VFbnJOLTFHRG5mVDIyQ05NYVdfcll6UzVEN6FupWxvZ2luo3RpZNkgSDEyNEdZSklYcVNHYnJjdmVna3R4MElkVXBZSGRQNWKjY2lk2SBsMmhPcDBTMHRrU0IwVEZ0dklZZlpaOUVhS0Z2clNjNg&client=l2hOp0S0tkSB0TFtvIYfZZ9EaKFvrSc6&protocol=oauth2&cache=%5Bobject%20Object%5D&redirect_uri=https%3A%2F%2Fconfluent.cloud%2Fauth_callback&redirect_path=%2F&last_org_resource_id_map=%7B%229b8e301a4f493a93b66ab610cab59fda77c4e89d0b1526739e77089cc4a72835%22%3A%7B%22org_resource_id%22%3A%22e3e109ca-0b0c-47a3-afc2-192061b8e750%22%2C%22timestamp%22%3A1673532746761%2C%22is_sso%22%3Afalse%7D%7D&segment_anon_id=ccea811c-bff6-4601-8306-0e3ec51706ad&scope=openid%20profile%20email%20offline_access&response_type=code&response_mode=query&nonce=SVNqcThpNjFNTC1ENWM1M1JrUER0cHJEfmFWeHZiX2Z2aFI3Qzg5V0JFZA%3D%3D&code_challenge=VnwcBiN9BDsphCJT3ZMgLlspExiskoBg0hwAPx1Vvok&code_challenge_method=S256&auth0Client=eyJuYW1lIjoiYXV0aDAtcmVhY3QiLCJ2ZXJzaW9uIjoiMS45LjAifQ%3D%3D)
  if you don't have one)
- Source Db (PostgreSQL)
- Sink Db (BigQuery)

## Step 1: Set up your enviroment
1. Provision a Kafka cluster in Confluent Cloud.
2. Create a ksqlDB application and navigate to the ksqlDB editor.  (NOTE: ksqlDB supports the use of SQL language for etl events within your Kafka cluster)

## Step 2: Execute ksqlDB code
The code below were not necessary if we already set up the connector using the UI.

```sql
CREATE SOURCE CONNECTOR IF NOT EXISTS iot_telemetry WITH (
  'connector.class'          = 'PostgresSource',
  'name'                     = 'recipe-postgres-iot_telemetry',
  'kafka.api.key'            = '<my-kafka-api-key>',
  'kafka.api.secret'         = '<my-kafka-api-secret>',
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
```

```sql
CREATE SINK CONNECTOR failed_devices_sink WITH (
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
```

## Step 3: Test with mock data 
If you are you not running source connectors to produce events, you can use ksqlDB INSERT INTO statements to insert mock data into the source topics:
```SQL
INSERT INTO iot_telemetry (device_id, ts) VALUES (1, 1655144403000);
INSERT INTO iot_telemetry (device_id, ts) VALUES (0, 1655144403000);
INSERT INTO iot_telemetry (device_id, ts) VALUES (0, 1655144423000);
INSERT INTO iot_telemetry (device_id, ts) VALUES (0, 1655144443000);
INSERT INTO iot_telemetry (device_id, ts) VALUES (0, 1655144463000);
INSERT INTO iot_telemetry (device_id, ts) VALUES (0, 1655144483000);
INSERT INTO iot_telemetry (device_id, ts) VALUES (0, 1655144503000);
INSERT INTO iot_telemetry (device_id, ts) VALUES (0, 1655144523000);
INSERT INTO iot_telemetry (device_id, ts) VALUES (0, 1655144543000);
INSERT INTO iot_telemetry (device_id, ts) VALUES (0, 1655144563000);
INSERT INTO iot_telemetry (device_id, ts) VALUES (0, 1655144583000);

```
## Step 4: Validate the process
Run the folling query:
```sql
SELECT device_id, lag_ms, window_start, window_end FROM iot_telemetry_lags WHERE lag_ms > threshold;
```
Your output should resemble:
```sql
+-------------------+-------------+------------------------+-----------------------+
|DEVICE_ID          |LAG_MS       |WINDOW_START            |WINDOW_END             |
+-------------------+-------------+------------------------+-----------------------+
|1                  |117000       |2022-06-13 18:20:00     |2022-06-13 18:22:00    |
Query terminated
```

## Step 6: Clean Up
Clean up the ksqlDB resources using the commands if necessary, remember to replace the stream or topic name. The `DELETE TOPIC` clause will also asynchronously delete the topic associated with the stream or table.
```sql
DROP TABLE IF EXISTS <table_name> DELETE TOPIC;
DROP STREAM IF EXISTS <stream_name> DELETE TOPIC;
```
You can also delete a connector using:
```sql
DROP CONNECTOR IF EXISTS <connector_name>;
```


## Additional Documentation
- [Confluent Cloud Documentation](https://docs.confluent.io/home/overview.html)
- [Apache Kafka Documentation](https://kafka.apache.org/documentation/)
