```log
Generated db_benchmarks app
[info] Elixir.Mix.Tasks.DbBenchmarks.CompareSelects.run from=2022-11-30 00:00:00 to=2022-12-01 23:59:59
Operating System: Linux
CPU Information: Intel(R) Core(TM) i5-8400 CPU @ 2.80GHz
Number of Available Cores: 6
Available memory: 15.56 GB
Elixir 1.13.4
Erlang 25.0.2

Benchmark suite executing with the following configuration:
warmup: 10 s
time: 50 s
memory time: 0 ns
reduction time: 0 ns
parallel: 10
inputs: none specified
Estimated total run time: 2 min

Benchmarking transaction_with_partition ...
Benchmarking transaction_without_partition ...

Name                                    ips        average  deviation         median         99th %
transaction_with_partition            0.140         7.12 s    ±50.81%         7.49 s        14.73 s
transaction_without_partition         0.139         7.17 s    ±60.60%         7.59 s        17.37 s

Comparison: 
transaction_with_partition            0.140
transaction_without_partition         0.139 - 1.01x slower +0.0502 s
[info] Elixir.Mix.Tasks.DbBenchmarks.CompareSelects.run from=2022-12-02 00:00:00 to=2022-12-03 23:59:59
Operating System: Linux
CPU Information: Intel(R) Core(TM) i5-8400 CPU @ 2.80GHz
Number of Available Cores: 6
Available memory: 15.56 GB
Elixir 1.13.4
Erlang 25.0.2

Benchmark suite executing with the following configuration:
warmup: 10 s
time: 50 s
memory time: 0 ns
reduction time: 0 ns
parallel: 10
inputs: none specified
Estimated total run time: 2 min

Benchmarking transaction_with_partition ...
Benchmarking transaction_without_partition ...

Name                                    ips        average  deviation         median         99th %
transaction_with_partition            0.156         6.42 s    ±57.57%         7.50 s        12.54 s
transaction_without_partition         0.133         7.53 s    ±53.25%         8.56 s        15.43 s

Comparison: 
transaction_with_partition            0.156
transaction_without_partition         0.133 - 1.17x slower +1.11 s
[info] Elixir.Mix.Tasks.DbBenchmarks.CompareSelects.run from=2022-12-15 00:00:00 to=2022-12-16 23:59:59
Operating System: Linux
CPU Information: Intel(R) Core(TM) i5-8400 CPU @ 2.80GHz
Number of Available Cores: 6
Available memory: 15.56 GB
Elixir 1.13.4
Erlang 25.0.2

Benchmark suite executing with the following configuration:
warmup: 10 s
time: 50 s
memory time: 0 ns
reduction time: 0 ns
parallel: 10
inputs: none specified
Estimated total run time: 2 min

Benchmarking transaction_with_partition ...
Benchmarking transaction_without_partition ...

Name                                    ips        average  deviation         median         99th %
transaction_with_partition            0.192         5.21 s    ±56.77%         5.09 s        13.09 s
transaction_without_partition         0.158         6.31 s    ±56.61%         6.75 s        14.04 s

Comparison: 
transaction_with_partition            0.192
transaction_without_partition         0.158 - 1.21x slower +1.10 s
[info] Elixir.Mix.Tasks.DbBenchmarks.CompareSelects.run from=2022-12-28 00:00:00 to=2022-12-29 23:59:59
Operating System: Linux
CPU Information: Intel(R) Core(TM) i5-8400 CPU @ 2.80GHz
Number of Available Cores: 6
Available memory: 15.56 GB
Elixir 1.13.4
Erlang 25.0.2

Benchmark suite executing with the following configuration:
warmup: 10 s
time: 50 s
memory time: 0 ns
reduction time: 0 ns
parallel: 10
inputs: none specified
Estimated total run time: 2 min

Benchmarking transaction_with_partition ...
Benchmarking transaction_without_partition ...

Name                                    ips        average  deviation         median         99th %
transaction_with_partition            16.11       0.0621 s   ±120.38%       0.0341 s         0.32 s
transaction_without_partition         0.120         8.35 s    ±38.21%         8.25 s        14.40 s

Comparison: 
transaction_with_partition            16.11
transaction_without_partition         0.120 - 134.49x slower +8.29 s
[info] Elixir.Mix.Tasks.DbBenchmarks.CompareInserts.run
Operating System: Linux
CPU Information: Intel(R) Core(TM) i5-8400 CPU @ 2.80GHz
Number of Available Cores: 6
Available memory: 15.56 GB
Elixir 1.13.4
Erlang 25.0.2

Benchmark suite executing with the following configuration:
warmup: 10 s
time: 10 s
memory time: 0 ns
reduction time: 0 ns
parallel: 10
inputs: none specified
Estimated total run time: 40 s

Benchmarking transaction_with_partition ...
Benchmarking transaction_without_partition ...

Name                                    ips        average  deviation         median         99th %
transaction_with_partition            48.69       20.54 ms   ±104.91%       16.68 ms      129.44 ms
transaction_without_partition          4.09      244.66 ms    ±42.85%      216.92 ms      576.91 ms

Comparison: 
transaction_with_partition            48.69
transaction_without_partition          4.09 - 11.91x slower +224.12 ms
```
