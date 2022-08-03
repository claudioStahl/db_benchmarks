defmodule DbBenchmarks.TimescaleRepo.Migrations.CreateTransactionWithoutPartition do
  use Ecto.Migration

  alias DbBenchmarks.Migration

  def up do
    execute("""
    CREATE TABLE "transactions" (
      "id" bigserial,
      "user_id" varchar(255) NOT NULL,
      "value" bigint NOT NULL,
      "balance" bigint NOT NULL,
      "inserted_at" timestamp(0) NOT NULL
    )
    """)

    Migration.insert_rows("transactions")

    execute("""
    ALTER TABLE transactions
    ADD PRIMARY KEY (id)
    """)

    execute("""
    CREATE INDEX transactions_idx ON transactions (
      user_id, inserted_at DESC
    )
    """)
  end

  def down do
    execute("""
    DROP TABLE transactions;
    """)
  end
end
