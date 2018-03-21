# Counter
echo -n 'testing.metric.testservice:1|c' | nc -w 2 -u -q0 localhost 8125

# Gauge
echo -n 'testing.metric.testservice:100|g' | nc -w 2 -u -q0 localhost 8125

# Timer
echo -n 'testing.metric.testservice:342|ms' | nc -w 2 -u -q0 localhost 8125
