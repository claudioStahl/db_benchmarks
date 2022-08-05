defmodule DbBenchmarks.TimescaleRepo.Migrations.CreateTransactionWithoutPartition do
  use Ecto.Migration

  alias DbBenchmarks.Migration

  def up do
    execute("""
    CREATE TABLE "transaction_with_hypertable" (
      "id" bigserial,
      "user_id" varchar(255) NOT NULL,
      "value" bigint NOT NULL,
      "balance" bigint NOT NULL,
      "inserted_at" timestamp NOT NULL
    )
    """)

    execute("""
    SELECT create_hypertable('transaction_with_hypertable', 'inserted_at');
    """)

    Migration.insert_rows("transaction_with_hypertable")

    execute("""
    CREATE INDEX transaction_with_hypertable_idx ON transaction_with_hypertable (
      user_id, inserted_at DESC
    )
    """)
  end

  def down do
    execute("""
    DROP TABLE transaction_with_hypertable;
    """)
  end
end
