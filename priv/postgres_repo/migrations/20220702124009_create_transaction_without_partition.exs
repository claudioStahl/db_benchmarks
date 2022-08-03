defmodule DbBenchmarks.Repo.Migrations.CreateTransactionWithoutPartition do
  use Ecto.Migration

  alias DbBenchmarks.Migration

  def up do
    execute("""
    CREATE TABLE "transaction_without_partition" (
      "id" bigserial,
      "user_id" varchar(255) NOT NULL,
      "value" bigint NOT NULL,
      "balance" bigint NOT NULL,
      "inserted_at" timestamp(0) NOT NULL
    )
    """)

    Migration.insert_rows("transaction_without_partition")

    execute("""
    ALTER TABLE transaction_without_partition
    ADD PRIMARY KEY (id)
    """)

    execute("""
    CREATE INDEX transaction_without_partition_idx ON transaction_without_partition (
      user_id, inserted_at DESC
    )
    """)
  end

  def down do
    execute("""
    DROP TABLE transaction_without_partition;
    """)
  end
end
