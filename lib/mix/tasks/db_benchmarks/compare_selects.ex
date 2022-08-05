defmodule Mix.Tasks.DbBenchmarks.CompareSelects do
  use Mix.Task

  alias DbBenchmarks.SQLSelectTask

  require Logger

  @requirements ["app.start"]

  @dates [
    {~N[2022-11-30 00:00:00], ~N[2022-12-01 23:59:59]},
    {~N[2022-12-02 00:00:00], ~N[2022-12-03 23:59:59]},
    {~N[2022-12-15 00:00:00], ~N[2022-12-16 23:59:59]},
    {~N[2022-12-28 00:00:00], ~N[2022-12-29 23:59:59]}
  ]

  def run(_args) do
    config = Application.fetch_env!(:db_benchmarks, :sql_repo_tables)

    Enum.each(@dates, fn {from, to} ->
      Logger.info("#{__MODULE__}.run from=#{from} to=#{to}")

      jobs =
        Enum.reduce(config, %{}, fn {repo, tables}, acc ->
          repo
          |> SQLSelectTask.jobs(tables, from, to)
          |> Map.merge(acc)
        end)

      Benchee.run(jobs,
        parallel: 10,
        warmup: 10,
        time: 50
      )
    end)
  end
end
