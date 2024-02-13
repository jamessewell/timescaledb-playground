CREATE TABLE sensors (sensorid text, ts timestamptz, value double precision);
SELECT create_hypertable('sensors', 'ts', chunk_time_interval=> interval '1 day');
