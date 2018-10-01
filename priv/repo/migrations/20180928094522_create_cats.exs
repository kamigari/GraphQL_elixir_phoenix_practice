defmodule CatCaffe.Repo.Migrations.CreateCats do
  use Ecto.Migration

  def change do
    create table(:cats) do
      add :name, :string
      add :owner, :string
      add :description, :text

      timestamps()
    end

  end
end
