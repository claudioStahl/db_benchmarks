defmodule Mix.Tasks.DbBenchmarks.CompareInserts do
  use Mix.Task

  alias DbBenchmarks.PostgresInserts
  alias DbBenchmarks.TimescaleInserts

  require Logger

  @requirements ["app.start"]

  @modules [
    PostgresInserts,
    TimescaleInserts
  ]

  def run(_args) do
    Logger.info("#{__MODULE__}.run")

    jobs =
      Enum.reduce(@modules, %{}, fn module, acc ->
        Map.merge(acc, module.jobs())
      end)

    Benchee.run(jobs,
      parallel: 10,
      warmup: 10,
      time: 10
    )
  end
end
