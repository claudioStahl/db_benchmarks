defmodule Mix.Tasks.DbBenchmarks.CompareInserts do
  use Mix.Task

  alias DbBenchmarks.Repo

  require Logger

  @requirements ["app.start"]

  @tables ~w(
    transaction_with_partition
    transaction_without_partition
    transaction_with_weekly_partition
    transaction_with_daily_partition
  )

  def run(_args) do
    Logger.info("#{__MODULE__}.run")

    user_ids = Repo.query_single_list!("select id from users limit $1", [10_000])
    start_time = System.monotonic_time()
    jobs = @tables |> Enum.map(&{&1, fn -> exec(&1, user_ids, start_time) end}) |> Map.new()

    Benchee.run(jobs,
      parallel: 10,
      warmup: 10,
      time: 10
    )
  end

  defp exec(table, user_ids, start_time) do
    name = "insert_#{table}"
    user_id = user_ids |> Enum.random() |> Ecto.UUID.cast!()
    start_dt = NaiveDateTime.new!(2023, 1, 1, 0, 0, 0)
    add = trunc((System.monotonic_time() - start_time) / 1_000)
    inserted_at = NaiveDateTime.add(start_dt, add, :millisecond)

    Repo.query!(
      """
      INSERT INTO #{table} (user_id, inserted_at, value, balance)
      values ($1, $2, round(random()*1000), round(random()*1000))
      """,
      [user_id, inserted_at],
      telemetry_options: [name: name],
      timeout: :infinity
    )
  end
end
