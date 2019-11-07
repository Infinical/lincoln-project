defmodule LincolnProject.Repo do
  use Ecto.Repo,
    otp_app: :lincoln_project,
    adapter: Ecto.Adapters.Postgres
end
