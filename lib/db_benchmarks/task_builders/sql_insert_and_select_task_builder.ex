defmodule DbBenchmarks.SQLInsertAndSelectTaskBuilder do
  @day 60 * 60 * 24
  @interval 2 * @day

  def build(repo, table) do
    start_time = System.monotonic_time()
    user_ids = repo.query_single_list!("select id from users limit $1", [10_000])

    [start_dt] =
      repo.query_single_list!(
        "select inserted_at from #{table} order by inserted_at desc limit 1",
        [],
        timeout: :infinity
      )

    fn -> exec(repo, table, user_ids, start_time, start_dt) end
  end

  defp exec(repo, table, user_ids, start_time, start_dt) do
    user_id = user_ids |> Enum.random() |> Ecto.UUID.cast!()
    add = trunc((System.monotonic_time() - start_time) / 1_000)
    inserted_at = NaiveDateTime.add(start_dt, add, :millisecond)
    from = NaiveDateTime.add(inserted_at, -@interval, :second)

    repo.query!(
      """
      INSERT INTO #{table} (user_id, inserted_at, value, balance)
      values ($1, $2, round(random()*1000), round(random()*1000))
      """,
      [user_id, inserted_at],
      timeout: :infinity
    )

    repo.query!(
      """
      SELECT sum(value), count(*)
      FROM #{table}
      WHERE user_id = $1 and inserted_at >= ($2) and inserted_at <= ($3)
      """,
      [user_id, from, inserted_at],
      timeout: :infinity
    )
  end
end
