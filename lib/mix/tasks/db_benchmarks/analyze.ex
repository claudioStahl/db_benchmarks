defmodule Mix.Tasks.DbBenchmarks.Analyze do
  use Mix.Task

  alias DbBenchmarks.PostgresRepo

  require Logger

  @requirements ["app.start"]

  def run(_args) do
    Logger.info("#{__MODULE__}.run")

    PostgresRepo.query!("ANALYZE", [], timeout: :infinity)
  end
end
