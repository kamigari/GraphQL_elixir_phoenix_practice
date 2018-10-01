defmodule CatCaffeWeb.Schema.CatTypes do
  use Absinthe.Schema.Notation

  @desc "A cat"
  object :cat do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :owner, non_null(:string)
    field :description, non_null(:string)
  end

  @desc "An existing cat"
  input_object :update_cat_params do
    field :name, non_null(:string)
    field :owner, non_null(:string)
    field :description, non_null(:string)
  end

end
