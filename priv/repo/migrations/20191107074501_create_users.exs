defmodule LincolnProject.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :password, :string
      add :age, :string
      add :class, :string
      add :school, :string
      add :guardian_name, :string
      add :guardian_phone, :string
      add :guardian_email, :string
      add :emergency_name, :string
      add :emergency_phone, :string
      add :role, :string
      add :is_active, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
