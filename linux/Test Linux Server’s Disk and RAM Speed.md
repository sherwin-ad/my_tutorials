## Test Linux Server’s Disk and RAM Speed

### Testing Disk Performance
```
# Install
sudo apt-get install fio
```

This runs random read and write tests using a 250 MB of data, at a ratio of 80% reads to 20% writes. The results will display in terms of IOPS and in MB/s:
```
fio --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=random_read_write.fio --bs=4k --iodepth=64 --size=250M --readwrite=randrw --rwmixread=80
```




### Testing Memory Performance

```
# Install
sudo apt-get install sysbench
```

The following command allocates 1 MB of RAM, then performs write operations until it has written 10 GB of data, (Don’t worry, you don’t need 10 GB of RAM to do this benchmark.)
```
sysbench --test=memory --memory-block-size=1M --memory-total-size=10G run
WARNING: the --test option is deprecated. You can pass a script name or path on the command line without any options.
sysbench 1.0.11 (using system LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Running memory speed test with the following options:
  block size: 1024KiB
  total size: 10240MiB
  operation: write
  scope: global

Initializing worker threads...

Threads started!

Total operations: 10240 (12877.77 per second)

10240.00 MiB transferred (12877.77 MiB/sec)


General statistics:
    total time:                          0.7929s
    total number of events:              10240

Latency (ms):
         min:                                  0.07
         avg:                                  0.08
         max:                                  0.32
         95th percentile:                      0.13
         sum:                                788.25

Threads fairness:
    events (avg/stddev):           10240.0000/0.00
    execution time (avg/stddev):   0.7883/0.00

```