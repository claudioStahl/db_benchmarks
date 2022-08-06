defmodule Mix.Tasks.DbBenchmarks.CompareInserts do
  use Mix.Task

  alias DbBenchmarks.SQLInsertTaskBuilder

  require Logger

  @requirements ["app.start"]

  def run(_args) do
    Logger.info("\n\n\n")
    Logger.info("#{__MODULE__}.run")

    config = Application.fetch_env!(:db_benchmarks, :sql_repo_tables)

    jobs =
      Enum.reduce(config, %{}, fn {repo, tables}, acc ->
        tables
        |> Enum.map(&{&1, SQLInsertTaskBuilder.build(repo, &1)})
        |> Map.new()
        |> Map.merge(acc)
      end)

    Benchee.run(jobs,
      parallel: 10,
      warmup: 60,
      time: 60
    )
  end
end
