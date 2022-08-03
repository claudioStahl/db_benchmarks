defmodule DbBenchmarks.TimescaleRepo do
  use Ecto.Repo,
    otp_app: :db_benchmarks,
    adapter: Ecto.Adapters.Postgres

  def query_single_list!(value, args \\ []) do
    %{rows: rows} = query!(value, args)
    Enum.map(rows, &Enum.at(&1, 0))
  end
end
