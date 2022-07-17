defmodule Mix.Tasks.DbBenchmarks.Analyze do
  use Mix.Task

  alias DbBenchmarks.Repo

  require Logger

  @requirements ["app.start"]

  def run(_args) do
    Logger.info("#{__MODULE__}.run")

    Repo.query!("ANALYZE", [], timeout: :infinity)
  end
end
