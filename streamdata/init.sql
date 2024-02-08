CREATE EXTENSION timescaledb;
CREATE EXTENSION timescaledb-toolkit;
CREATE TABLE sensors (sensorid integer, ts timestamptz, value real);
SELECT create_hypertable('sensors', 'ts', chunk_time_interval=> interval '1 day');
