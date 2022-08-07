A project to compare the performance of some databases.

## Databases

- [x] Postgres without partition
- [x] Postgres with partition
- [x] TimescaleDB with Hypertables
- [ ] Cassandra

## Requirements

- erlang 25.0.2
- elixir 1.13.4-otp-25

## Commands

1. `mix setup`
2. `mix db_benchmarks.compare_all`

## Outputs

https://github.com/claudioStahl/db_benchmarks/tree/master/outputs
