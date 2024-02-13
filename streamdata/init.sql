-- Create a table to store our sensor information
CREATE TABLE sensors (sensorid text, ts timestamptz, value double precision);

-- Turn the table into a hypertable, enabling transparent partitioning and TimescaleDB
-- planner optimizations
SELECT create_hypertable('sensors', 'ts', 
                         chunk_time_interval=> interval '1 day', 
                         create_default_indexes=>false);

-- Create an index which enables TimescaleDB SkipScan for our query
CREATE INDEX ON sensors (sensorid, ts DESC);
