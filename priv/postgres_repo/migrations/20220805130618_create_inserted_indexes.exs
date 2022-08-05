defmodule DbBenchmarks.PostgresRepo.Migrations.CreateInsertedIndexes do
  use Ecto.Migration

  def up do
    execute("""
    CREATE INDEX transaction_without_partition_inserted_at_idx ON transaction_without_partition (
      inserted_at DESC
    )
    """)

    execute("""
    CREATE INDEX transaction_with_partition_inserted_at_idx ON transaction_with_partition (
      inserted_at DESC
    )
    """)
  end
end
