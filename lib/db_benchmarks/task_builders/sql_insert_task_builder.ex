defmodule DbBenchmarks.SQLInsertTaskBuilder do
  def build(repo, table) do
    start_time = System.monotonic_time()
    user_ids = repo.query_single_list!("select id from users limit $1", [10_000])

    [start_dt] =
      repo.query_single_list!(
        "select inserted_at from #{table} order by inserted_at desc limit 1"
      )

    repo.query_single_list!("select inserted_at from #{table} order by inserted_at desc limit 1")
    fn -> exec(repo, table, user_ids, start_time, start_dt) end
  end

  defp exec(repo, table, user_ids, start_time, start_dt) do
    user_id = user_ids |> Enum.random() |> Ecto.UUID.cast!()
    add = trunc((System.monotonic_time() - start_time) / 1_000)
    inserted_at = NaiveDateTime.add(start_dt, add, :millisecond)

    repo.query!(
      """
      INSERT INTO #{table} (user_id, inserted_at, value, balance)
      values ($1, $2, round(random()*1000), round(random()*1000))
      """,
      [user_id, inserted_at],
      timeout: :infinity
    )
  end
end
