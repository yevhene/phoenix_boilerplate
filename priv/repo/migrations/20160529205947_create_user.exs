defmodule Hourly.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION citext;")

    create table(:users) do
      add :name, :string
      add :email, :citext
      add :is_admin, :boolean, default: false

      timestamps
    end

    create unique_index(:users, [:email])
  end
end
