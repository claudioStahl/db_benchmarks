defmodule Mix.Tasks.DbBenchmarks.CompareSelects do
  use Mix.Task

  alias DbBenchmarks.Repo

  require Logger

  @requirements ["app.start"]

  @tables ~w(
    transaction_with_partition
    transaction_without_partition
  )

  @dates [
    {~N[2022-11-30 00:00:00], ~N[2022-12-01 23:59:59]},
    {~N[2022-12-02 00:00:00], ~N[2022-12-03 23:59:59]},
    {~N[2022-12-15 00:00:00], ~N[2022-12-16 23:59:59]},
    {~N[2022-12-28 00:00:00], ~N[2022-12-29 23:59:59]}
  ]

  def run(_args) do
    Enum.each(@dates, fn {from, to} ->
      Logger.info("#{__MODULE__}.run from=#{from} to=#{to}")

      user_ids = Repo.query_single_list!("select id from users limit $1", [10_000])
      jobs = @tables |> Enum.map(&{&1, fn -> exec(&1, user_ids, from, to) end}) |> Map.new()

      Benchee.run(jobs,
        parallel: 10,
        warmup: 10,
        time: 50
      )
    end)
  end

  defp exec(table, user_ids, from, to) do
    name = "select_#{table}"
    user_id = user_ids |> Enum.random() |> Ecto.UUID.cast!()

    Repo.query!(
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
