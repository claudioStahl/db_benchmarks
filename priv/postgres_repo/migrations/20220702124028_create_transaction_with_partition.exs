defmodule DbBenchmarks.PostgresRepo.Migrations.CreateTransactionWithPartition do
  use Ecto.Migration

  alias DbBenchmarks.Migration

  def up do
    Migration.create_partition("transaction_with_partition")
    Migration.insert_rows("transaction_with_partition")

    # execute("""
    # ALTER TABLE transaction_with_partition
    # ADD PRIMARY KEY ("inserted_at", "id")
    # """)

    execute("""
    CREATE INDEX transaction_with_partition_idx ON transaction_with_partition (
      user_id, inserted_at DESC
    )
    """)
  end

  def down do
    Migration.drop_partition("transaction_with_partition")
  end
end
