defmodule Mix.Tasks.DbBenchmarks.CompareInserts do
  use Mix.Task

  alias DbBenchmarks.PostgresInserts

  require Logger

  @requirements ["app.start"]

  def run(_args) do
    Logger.info("#{__MODULE__}.run")

    jobs = PostgresInserts.jobs()

    Benchee.run(jobs,
      parallel: 10,
      warmup: 10,
      time: 10
    )
  end
end
