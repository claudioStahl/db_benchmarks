import Config

config :db_benchmarks,
  ecto_repos: [DbBenchmarks.Repo],
  serie_start: "2022-01-01",
  serie_finish: "2022-12-31",
  # serie_finish: "2022-01-02",
  serie_interval: "5 minute"

config :db_benchmarks, DbBenchmarks.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "postgres",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 30

config :logger, :console, format: "[$level] $message\n"

config :logger, level: :info
