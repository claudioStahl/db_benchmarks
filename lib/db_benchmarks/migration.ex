defmodule DbBenchmarks.Migration do
  use Ecto.Migration

  require Logger

  def insert_rows(table) do
    execute("""
    INSERT INTO #{table} (user_id, value, balance, inserted_at)
    SELECT users.id, round(random()*1000), round(random()*1000), i
    FROM generate_series(
      '#{serie_start()}'::text::timestamp,
      '#{serie_finish()}'::text::timestamp,
      '#{serie_interval()}'::text::interval
    ) s(i)
    CROSS JOIN users;
    """)
  end

  def create_partition(table, interval \\ "monthly", premake \\ 30) do
    execute("""
    CREATE TABLE "#{table}" (
      "id" bigserial,
      "user_id" varchar(255) NOT NULL,
      "value" bigint NOT NULL,
      "balance" bigint NOT NULL,
      "inserted_at" timestamp(0) NOT NULL
    ) PARTITION BY RANGE (inserted_at);
    """)

    execute("""
    SELECT partman.create_parent(
      p_parent_table => 'public.#{table}',
      p_control => 'inserted_at',
      p_type => 'native',
      p_interval => '#{interval}',
      p_premake => #{premake},
      p_start_partition => '2022-01-01'
    );
    """)
  end

  def drop_partition(table) do
    execute("""
    DROP TABLE #{table};
    """)

    execute("""
    DROP TABLE partman.template_public_#{table};
    """)

    execute("""
    DELETE FROM partman.part_config WHERE parent_table = 'public.#{table}';
    """)
  end

  defp serie_start, do: Application.fetch_env!(:db_benchmarks, :serie_start)
  defp serie_finish, do: Application.fetch_env!(:db_benchmarks, :serie_finish)
  defp serie_interval, do: Application.fetch_env!(:db_benchmarks, :serie_interval)
end
