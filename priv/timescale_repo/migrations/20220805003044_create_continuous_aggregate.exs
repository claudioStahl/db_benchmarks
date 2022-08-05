defmodule DbBenchmarks.TimescaleRepo.Migrations.CreateContinuousAggregate do
  use Ecto.Migration

  @disable_ddl_transaction true
  @disable_migration_lock true

  def up do
    execute("""
    CREATE MATERIALIZED VIEW transaction_with_hypertable_ca
    WITH (timescaledb.continuous) AS
      SELECT user_id, time_bucket('1 hour', inserted_at) as time, sum(value) as sumv, count(*) as total
        FROM transaction_with_hypertable
        GROUP BY user_id, time
    """)
  end

  def down do
    execute("""
    DROP MATERIALIZED VIEW transaction_with_hypertable_ca;
    """)
  end
end
