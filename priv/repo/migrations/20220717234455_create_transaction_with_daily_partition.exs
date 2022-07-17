defmodule DbBenchmarks.Repo.Migrations.CreateTransactionWithDailyPartition do
  use Ecto.Migration

  alias DbBenchmarks.Migration

  def up do
    Migration.create_partition("transaction_with_daily_partition")
    Migration.insert_rows("transaction_with_daily_partition", "daily", 900)

    execute("""
    CREATE INDEX transaction_with_daily_partition_idx ON transaction_with_daily_partition (
      user_id, inserted_at DESC
    )
    """)
  end

  def down do
    Migration.drop_partition("transaction_with_daily_partition")
  end
end
