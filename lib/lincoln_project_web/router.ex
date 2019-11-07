defmodule LincolnProjectWeb.Router do
  use LincolnProjectWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :admin do
    plug :put_layout, {LincolnProjectWeb.LayoutView, "admin.html"}
  end

  scope "/", LincolnProjectWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/registrations", UserController
  end

  scope "/admin", LincolnProjectWeb do
    pipe_through [:browser, :admin]
    get "/", AdminController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", LincolnProjectWeb do
  #   pipe_through :api
  # end
end
