defmodule CatCaffeWeb.Schema do
  use Absinthe.Schema
  import_types CatCaffeWeb.Schema.CatTypes

  alias CatCaffeWeb.Resolvers

  query do

    @desc "Get all cats"
    field :all_cats, non_null(list_of(non_null(:cat))), do: resolve &Resolvers.Animals.all_cats/3

    @desc "Get a specific cat"
    field :find_cat, :cat do
      arg :id, non_null(:id)
      resolve &Resolvers.Animals.find_cat/3
    end

  end

  mutation do

    @desc "Create a new cat"
    field :create_cat, :cat do
      arg :name, non_null(:string)
      arg :owner, non_null(:string)
      arg :description, non_null(:string)
      resolve &Resolvers.Animals.create_cat/3
    end

    @desc "Update an existing cat"
    field :update_cat, :cat do
      arg :id, non_null(:id)
      arg :cat, :update_cat_params
      resolve &Resolvers.Animals.update_cat/3
    end

    @desc "Delete an existing cat"
    field :delete_cat, :cat do
      arg :id, non_null(:id)
      resolve &Resolvers.Animals.delete_cat/3
    end

  end

end
