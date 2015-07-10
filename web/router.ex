defmodule CommonStandardsProject.Router do
  use CommonStandardsProject.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CommonStandardsProject do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", CommonStandardsProject do
    pipe_through :api
    resources "/jurisdictions", JurisdictionController
  end
end
