defmodule DbBenchmarks.Repo.Migrations.CreateTransactionWithPartitionAndBrin do
  use Ecto.Migration

  alias DbBenchmarks.Migration

  def up do
    Migration.create_partition("transaction_with_partition_and_brin")
    Migration.insert_rows("transaction_with_partition_and_brin")

    execute("""
    CREATE INDEX transaction_with_partition_and_brin_idx
    ON transaction_with_partition_and_brin
    USING BRIN (user_id, inserted_at)
    WITH (pages_per_range = 32);
    """)
  end

  def down do
    Migration.drop_partition("transaction_with_partition_and_brin")
  end
end
