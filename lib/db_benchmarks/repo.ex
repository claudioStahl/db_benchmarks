defmodule DbBenchmarks.Repo do
  use Ecto.Repo,
    otp_app: :db_benchmarks,
    adapter: Ecto.Adapters.Postgres
end
