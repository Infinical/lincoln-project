defmodule LincolnProject.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :age, :string
    field :class, :string
    field :email, :string
    field :emergency_name, :string
    field :emergency_phone, :string
    field :first_name, :string
    field :guardian_email, :string
    field :guardian_name, :string
    field :guardian_phone, :string
    field :is_active, :boolean, default: false
    field :last_name, :string
    field :password, :string
    field :role, :string, default: "ambassador"
    field :school, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :first_name,
      :last_name,
      :email,
      :password,
      :age,
      :class,
      :school,
      :guardian_name,
      :guardian_phone,
      :guardian_email,
      :emergency_name,
      :emergency_phone
    ])
    |> validate_required([
      :first_name,
      :last_name,
      :email,
      :password,
      :age,
      :class,
      :school,
      :guardian_name,
      :guardian_phone,
      :guardian_email,
      :emergency_name,
      :emergency_phone
    ])
    |> unique_constraint(:email)
  end
end
