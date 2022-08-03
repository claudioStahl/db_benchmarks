import Config

config :db_benchmarks,
  ecto_repos: [DbBenchmarks.PostgresRepo],
  serie_start: "2022-01-01",
  # serie_finish: "2022-12-31",
  serie_finish: "2022-01-02",
  serie_interval: "10 minute"

config :db_benchmarks, DbBenchmarks.PostgresRepo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "postgres",
  port: 5432,
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 30

config :logger, :console, format: "[$level] $message\n"

config :logger, level: :info
