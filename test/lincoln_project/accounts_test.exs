defmodule LincolnProject.AccountsTest do
  use LincolnProject.DataCase

  alias LincolnProject.Accounts

  describe "users" do
    alias LincolnProject.Accounts.User

    @valid_attrs %{
      age: "some age",
      class: "some class",
      email: "some email",
      emergency_name: "some emergency_name",
      emergency_phone: "some emergency_phone",
      first_name: "some first_name",
      guardian_email: "some guardian_email",
      guardian_name: "some guardian_name",
      guardian_phone: "some guardian_phone",
      is_active: true,
      last_name: "some last_name",
      password: "some password",
      role: "some role",
      school: "some school"
    }
    @update_attrs %{
      age: "some updated age",
      class: "some updated class",
      email: "some updated email",
      emergency_name: "some updated emergency_name",
      emergency_phone: "some updated emergency_phone",
      first_name: "some updated first_name",
      guardian_email: "some updated guardian_email",
      guardian_name: "some updated guardian_name",
      guardian_phone: "some updated guardian_phone",
      is_active: false,
      last_name: "some updated last_name",
      password: "some updated password",
      role: "some updated role",
      school: "some updated school"
    }
    @invalid_attrs %{
      age: nil,
      class: nil,
      email: nil,
      emergency_name: nil,
      emergency_phone: nil,
      first_name: nil,
      guardian_email: nil,
      guardian_name: nil,
      guardian_phone: nil,
      is_active: nil,
      last_name: nil,
      password: nil,
      role: nil,
      school: nil
    }

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.age == "some age"
      assert user.class == "some class"
      assert user.email == "some email"
      assert user.emergency_name == "some emergency_name"
      assert user.emergency_phone == "some emergency_phone"
      assert user.first_name == "some first_name"
      assert user.guardian_email == "some guardian_email"
      assert user.guardian_name == "some guardian_name"
      assert user.guardian_phone == "some guardian_phone"
      assert user.is_active == true
      assert user.last_name == "some last_name"
      assert user.password == "some password"
      assert user.role == "some role"
      assert user.school == "some school"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.age == "some updated age"
      assert user.class == "some updated class"
      assert user.email == "some updated email"
      assert user.emergency_name == "some updated emergency_name"
      assert user.emergency_phone == "some updated emergency_phone"
      assert user.first_name == "some updated first_name"
      assert user.guardian_email == "some updated guardian_email"
      assert user.guardian_name == "some updated guardian_name"
      assert user.guardian_phone == "some updated guardian_phone"
      assert user.is_active == false
      assert user.last_name == "some updated last_name"
      assert user.password == "some updated password"
      assert user.role == "some updated role"
      assert user.school == "some updated school"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
