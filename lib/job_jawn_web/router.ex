defmodule JobJawnWeb.Router do
  use JobJawnWeb, :router

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

  scope "/", JobJawnWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", JobJawnWeb do
    pipe_through :api

    resources "/addresses", AddressController, only: [:index, :show]
    resources "/companies", CompanyController, only: [:index, :show]
    resources "/disciplines", DisciplineController, only: [:index, :show]
    resources "/employment_types", EmploymentTypeController, only: [:index, :show]
    resources "/industries", IndustryController, only: [:index, :show]
    resources "/jobs", JobController, only: [:index, :show]
    resources "/skills", SkillController, only: [:index, :show]
    resources "/titles", TitleController, only: [:index, :show]
  end
end
