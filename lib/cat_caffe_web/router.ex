defmodule CatCaffeWeb.Router do
  use CatCaffeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CatCaffeWeb do
    pipe_through :api
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: CatCaffeWeb.Schema,
      interface: :simple,
      context: %{pubsub: CatCaffeWeb.Endpoint}
  end

end
