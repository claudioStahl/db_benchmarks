defmodule DbBenchmarks.Repo.Migrations.CreateExtensions do
  use Ecto.Migration

  def up do
    execute("""
    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
    """)
  end

  def down do
    nil
  end
end
