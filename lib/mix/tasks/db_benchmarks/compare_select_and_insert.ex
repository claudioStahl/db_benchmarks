defmodule Mix.Tasks.DbBenchmarks.CompareSelectAndInsert do
  use Mix.Task

  alias DbBenchmarks.PostgresRepo
  alias DbBenchmarks.TimescaleRepo
  alias DbBenchmarks.SQLInsertAndSelectTaskBuilder
  alias DbBenchmarks.TimescaleInsertAndSelectTaskBuilder

  require Logger

  @requirements ["app.start"]

  def run(_args) do
    Logger.info("#{__MODULE__}.run")

    jobs = %{
      transaction_with_partition:
        SQLInsertAndSelectTaskBuilder.build(PostgresRepo, "transaction_with_partition"),
      transaction_without_partition:
        SQLInsertAndSelectTaskBuilder.build(PostgresRepo, "transaction_without_partition"),
      transaction_with_hypertable:
        SQLInsertAndSelectTaskBuilder.build(TimescaleRepo, "transaction_with_hypertable"),
      transaction_with_hypertable_ca:
        TimescaleInsertAndSelectTaskBuilder.build(
          TimescaleRepo,
          "transaction_with_hypertable",
          "transaction_with_hypertable_ca"
        )
    }

    Benchee.run(jobs,
      parallel: 10,
      warmup: 60,
      time: 60
    )
  end
end
