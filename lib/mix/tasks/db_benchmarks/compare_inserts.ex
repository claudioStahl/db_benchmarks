defmodule Mix.Tasks.DbBenchmarks.CompareInserts do
  use Mix.Task

  alias DbBenchmarks.SQLInsertTask

  require Logger

  @requirements ["app.start"]

  def run(_args) do
    Logger.info("#{__MODULE__}.run")

    config = Application.fetch_env!(:db_benchmarks, :sql_repo_tables)

    jobs =
      Enum.reduce(config, %{}, fn {repo, tables}, acc ->
        Map.merge(acc, SQLInsertTask.jobs(repo, tables))
      end)

    Benchee.run(jobs,
      parallel: 10,
      warmup: 10,
      time: 10
    )
  end
end
