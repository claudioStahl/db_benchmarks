defmodule DbBenchmarks.SQLSelectTaskBuilder do
  def build(repo, table, from, to) do
    user_ids = repo.query_single_list!("select id from users limit $1", [10_000])
    fn -> exec(repo, table, user_ids, from, to) end
  end

  defp exec(repo, table, user_ids, from, to) do
    user_id = user_ids |> Enum.random() |> Ecto.UUID.cast!()

    repo.query!(
      """
      SELECT sum(value), count(*)
      FROM #{table}
      WHERE user_id = $1 and inserted_at >= ($2) and inserted_at <= ($3)
      """,
      [user_id, from, to],
      timeout: :infinity
    )
  end
end
