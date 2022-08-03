defmodule DbBenchmarks.PostgresSelects do
  alias DbBenchmarks.PostgresRepo

  require Logger

  @tables ~w(
    transaction_with_partition
    transaction_without_partition
  )

  def jobs(from, to) do
    user_ids = PostgresRepo.query_single_list!("select id from users limit $1", [10_000])
    @tables |> Enum.map(&{&1, fn -> exec(&1, user_ids, from, to) end}) |> Map.new()
  end

  defp exec(table, user_ids, from, to) do
    name = "select_#{table}"
    user_id = user_ids |> Enum.random() |> Ecto.UUID.cast!()

    PostgresRepo.query!(
      """
      SELECT sum(value), count(*)
      FROM #{table}
      WHERE user_id = $1 and inserted_at >= ($2) and inserted_at <= ($3)
      """,
      [user_id, from, to],
      telemetry_options: [name: name],
      timeout: :infinity
    )
  end
end