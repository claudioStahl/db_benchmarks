defmodule DbBenchmarks.Repo.Migrations.CreateTransactionWithPartitionAndBrin2 do
  use Ecto.Migration

  alias DbBenchmarks.Migration

  def up do
    Migration.create_partition("transaction_with_partition_and_brin2")
    Migration.insert_rows("transaction_with_partition_and_brin2")

    execute("""
    CREATE INDEX transaction_with_partition_and_brin2_idx
    ON transaction_with_partition_and_brin2
    USING BRIN (inserted_at)
    WITH (pages_per_range = 32);
    """)
  end

  def down do
    Migration.drop_partition("transaction_with_partition_and_brin2")
  end
end
