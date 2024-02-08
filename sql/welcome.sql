-- Welcome to the TimescaleDB GitHub Codespace tutorial!

-- You should see a psql session start in the terminal
-- below, when it's ready you will see a TimescaleDB
-- banner.

-- You can run the SQL below either by copy and pasting it,
-- or by running the following in the psql session

--  \i ./sql/welcome.sql

-- First let's create a table and make it a hypertable

CREATE TABLE sensors (sensorid bigint, ts timestamptz, value real);
SELECT create_hypertable('sensors', 'ts', chunk_time_interval=> interval '1 day');

