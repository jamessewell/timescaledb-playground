CREATE TABLE sensors (sensorid text, ts timestamptz, value double precision);
SELECT create_hypertable('sensors', 'ts', chunk_time_interval=> interval '1 day', create_default_indexes=>false);
CREATE INDEX ON sensors (sensorid, ts DESC);
