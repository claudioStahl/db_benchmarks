defmodule DbBenchmarks.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def up do
    execute("""
    CREATE TABLE "users" (
      "id" uuid NOT NULL, "inserted_at" timestamp(0) NOT NULL
    )
    """)

    execute("""
    INSERT INTO users (id, inserted_at)
    SELECT uuid_generate_v4(), now()
    FROM generate_series(1, 10000) s(i);
    """)

    execute("""
    ALTER TABLE users
    ADD PRIMARY KEY (id)
    """)
  end

  def down do
    execute("""
    DROP TABLE users;
    """)
  end
end
