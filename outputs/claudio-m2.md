claudio@DESKTOP-OLS5DVT:~/db_benchmarks$ mix db_benchmarks.compare_selects
Compiling 6 files (.ex)
Generated db_benchmarks app
[info] Elixir.Mix.Tasks.DbBenchmarks.CompareSelects.run from=2022-11-30 00:00:00 to=2022-12-01 23:59:59
Operating System: Linux
CPU Information: Intel(R) Core(TM) i5-8400 CPU @ 2.80GHz
Number of Available Cores: 6
Available memory: 12.43 GB
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
transaction_without_partition        106.51        9.39 ms   ±111.71%        5.74 ms       47.83 ms
transaction_with_partition            88.11       11.35 ms   ±118.81%        6.28 ms       55.66 ms

Comparison:
transaction_without_partition        106.51
transaction_with_partition            88.11 - 1.21x slower +1.96 ms
[info] Elixir.Mix.Tasks.DbBenchmarks.CompareSelects.run from=2022-12-02 00:00:00 to=2022-12-03 23:59:59
Operating System: Linux
CPU Information: Intel(R) Core(TM) i5-8400 CPU @ 2.80GHz
Number of Available Cores: 6
Available memory: 12.43 GB
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
transaction_without_partition        104.55        9.57 ms   ±113.01%        5.75 ms       49.08 ms
transaction_with_partition            95.45       10.48 ms   ±116.42%        6.03 ms       52.66 ms

Comparison:
transaction_without_partition        104.55
transaction_with_partition            95.45 - 1.10x slower +0.91 ms
[info] Elixir.Mix.Tasks.DbBenchmarks.CompareSelects.run from=2022-12-15 00:00:00 to=2022-12-16 23:59:59
Operating System: Linux
CPU Information: Intel(R) Core(TM) i5-8400 CPU @ 2.80GHz
Number of Available Cores: 6
Available memory: 12.43 GB
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
transaction_without_partition        101.92        9.81 ms   ±109.19%        6.02 ms       48.90 ms
transaction_with_partition            91.06       10.98 ms   ±114.58%        6.30 ms       53.54 ms

Comparison:
transaction_without_partition        101.92
transaction_with_partition            91.06 - 1.12x slower +1.17 ms
[info] Elixir.Mix.Tasks.DbBenchmarks.CompareSelects.run from=2022-12-28 00:00:00 to=2022-12-29 23:59:59
Operating System: Linux
CPU Information: Intel(R) Core(TM) i5-8400 CPU @ 2.80GHz
Number of Available Cores: 6
Available memory: 12.43 GB
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
transaction_without_partition        102.21        9.78 ms   ±109.90%        5.93 ms       48.61 ms
transaction_with_partition            92.12       10.85 ms   ±115.79%        6.23 ms       53.35 ms

Comparison:
transaction_without_partition        102.21
transaction_with_partition            92.12 - 1.11x slower +1.07 ms

[info] Elixir.Mix.Tasks.DbBenchmarks.CompareInserts.run
Operating System: Linux
CPU Information: Intel(R) Core(TM) i5-8400 CPU @ 2.80GHz
Number of Available Cores: 6
Available memory: 12.43 GB
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
transaction_with_partition           346.45        2.89 ms    ±47.40%        2.57 ms        9.71 ms
transaction_without_partition        329.54        3.03 ms    ±53.44%        2.64 ms       10.46 ms

Comparison:
transaction_with_partition           346.45
transaction_without_partition        329.54 - 1.05x slower +0.148 ms