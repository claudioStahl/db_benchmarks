defmodule DbBenchmarks.Repo.Migrations.CreateTransactionWithWeeklyPartition do
  use Ecto.Migration

  alias DbBenchmarks.Migration

  def up do
    Migration.create_partition("transaction_with_weekly_partition", "weekly", 120)
    Migration.insert_rows("transaction_with_weekly_partition")

    execute("""
    CREATE INDEX transaction_with_weekly_partition_idx ON transaction_with_weekly_partition (
      user_id, inserted_at DESC
    )
    """)
  end

  def down do
    Migration.drop_partition("transaction_with_weekly_partition")
  end
end
