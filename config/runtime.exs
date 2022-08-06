import Config

development? = System.get_env("DEVELOPMENT") == "true"
IO.inspect(development?, label: "development")

if development? do
  config :db_benchmarks, serie_finish: "2022-01-02"
end
