# Timescale Playground Demo

## Query the latest values with SkipScan

This demo has started two containers:

- a PostgreSQL+TimescaleDB container configured with a `sensors` hypertable to store readings
- a ShadowTraffic container creating real-time sensor data and sending it to TimescaleDB

Data is currently ingesting, you can see how it was configured in the other open files:
- In the `sensors.json` tab to the left you can see the ShadowTraffic configration.
- In the `init.sql` tab to the left you can see how our TimescaleDB schema was created

A few seconds after startup the terminal below will start running the following SQL query 
every 500ms (.5 seconds):


```sql
SELECT DISTINCT ON (sensorid) sensorid, 
       ts, 
       value as last_value
  FROM sensors 
  ORDER BY sensorid, ts DESC;
```

This uses the TimescaleDB SkipScan optimization to return the latest value and timestamp for each `sensorid` which
has recorded data.

The query run time is listed below the output, it should be hovering around .6ms (0.0006 seconds).
