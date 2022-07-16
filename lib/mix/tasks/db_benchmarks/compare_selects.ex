defmodule Mix.Tasks.DbBenchmarks.CompareSelects do
  use Mix.Task

  alias DbBenchmarks.Repo

  require Logger

  @requirements ["app.start"]

  @tables ~w(
    transaction_with_partition
    transaction_without_partition
    transaction_with_partition_and_brin
    transaction_with_partition_and_brin2
  )

  def run(args) do
    level = Enum.at(args, 0) || "1"

    Logger.info("#{__MODULE__}.run level=#{level}")

    user_ids = Repo.query_single_list!("select id from users limit $1", [10_000])
    jobs = @tables |> Enum.map(&{&1, fn -> exec(&1, user_ids, level) end}) |> Map.new()

    Benchee.run(jobs,
      parallel: 10,
      warmup: 10,
      time: 50
    )
  end

  defp exec(table, user_ids, level) do
    name = "select_#{table}"
    user_id = user_ids |> Enum.random() |> Ecto.UUID.cast!()

    {from, to} =
      if level == "1" do
        {~N[2022-11-30 00:00:00], ~N[2022-12-01 23:59:59]}
      else
        {~N[2022-12-01 00:00:00], ~N[2022-12-02 23:59:59]}
      end

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
