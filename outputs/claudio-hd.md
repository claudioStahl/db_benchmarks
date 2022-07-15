# System

```
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
```

# Select level 1

```
Name                                           ips        average  deviation         median         99th %
transaction_without_partition                11.03       90.64 ms   ±166.85%       49.94 ms      581.35 ms
transaction_with_partition                    6.62      151.15 ms   ±199.50%       78.20 ms     1621.68 ms
transaction_with_partition_and_brin           4.61      216.76 ms    ±21.76%      215.27 ms      334.05 ms
transaction_with_partition_and_brin2          1.90      526.60 ms    ±14.64%      523.08 ms      717.70 ms

Comparison: 
transaction_without_partition                11.03
transaction_with_partition                    6.62 - 1.67x slower +60.51 ms
transaction_with_partition_and_brin           4.61 - 2.39x slower +126.12 ms
transaction_with_partition_and_brin2          1.90 - 5.81x slower +435.97 ms
```

# Select level 2

```
Name                                           ips        average  deviation         median         99th %
transaction_with_partition                   36.23       27.60 ms   ±230.66%        3.96 ms      272.41 ms
transaction_without_partition                28.56       35.01 ms   ±196.38%        3.07 ms      327.01 ms
transaction_with_partition_and_brin           4.74      211.16 ms    ±22.45%      210.03 ms      326.46 ms
transaction_with_partition_and_brin2          3.94      253.83 ms    ±31.05%      234.73 ms      438.10 ms

Comparison: 
transaction_with_partition                   36.23
transaction_without_partition                28.56 - 1.27x slower +7.41 ms
transaction_with_partition_and_brin           4.74 - 7.65x slower +183.56 ms
transaction_with_partition_and_brin2          3.94 - 9.20x slower +226.23 ms
```

# Insert

```
Name                                           ips        average  deviation         median         99th %
transaction_with_partition_and_brin          51.70       19.34 ms    ±79.77%       16.66 ms      132.96 ms
transaction_with_partition                   50.20       19.92 ms    ±86.96%       16.67 ms      138.49 ms
transaction_with_partition_and_brin2         49.26       20.30 ms    ±82.69%       16.68 ms      133.05 ms
transaction_without_partition                 3.53      282.90 ms    ±50.92%      233.96 ms      717.10 ms

Comparison: 
transaction_with_partition_and_brin          51.70
transaction_with_partition                   50.20 - 1.03x slower +0.58 ms
transaction_with_partition_and_brin2         49.26 - 1.05x slower +0.96 ms
transaction_without_partition                 3.53 - 14.63x slower +263.56 ms
```
