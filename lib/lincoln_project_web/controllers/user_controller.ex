defmodule LincolnProjectWeb.UserController do
  use LincolnProjectWeb, :controller

  alias LincolnProject.Accounts
  alias LincolnProject.Accounts.User
  alias Plug.Conn

  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: Routes.user_path(conn, :new))

        SendGrid.Email.build()
        |> SendGrid.Email.add_to("inficalvin@gmail.com")
        |> SendGrid.Email.put_from("test2@email.com")
        |> SendGrid.Email.put_subject("Hello from Elixir")
        |> SendGrid.Email.put_text("Sent with Elixir")
        |> SendGrid.Mail.send()

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
