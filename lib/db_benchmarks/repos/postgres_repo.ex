defmodule DbBenchmarks.PostgresRepo do
  use Ecto.Repo,
    otp_app: :db_benchmarks,
    adapter: Ecto.Adapters.Postgres

  def query_single_list!(value, args \\ [], options \\ []) do
    %{rows: rows} = query!(value, args, options)
    Enum.map(rows, &Enum.at(&1, 0))
  end
end
