defmodule CatCaffe.Animals.Cat do
  use Ecto.Schema
  import Ecto.Changeset


  schema "cats" do
    field :description, :string
    field :name, :string
    field :owner, :string

    timestamps()
  end

  @doc false
  def changeset(cat, attrs) do
    cat
    |> cast(attrs, [:name, :owner, :description])
    |> validate_required([:name, :owner, :description])
  end
end
