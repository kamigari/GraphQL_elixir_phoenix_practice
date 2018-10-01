defmodule CatCaffeWeb.Resolvers.Animals do
  alias CatCaffe.Animals

  def all_cats(_root, _args, _info) do
    {:ok, Animals.list_cats}
  end

  def find_cat(_root, %{:id => id}, _info) do
    case Animals.get_cat(id) do
      nil ->
        {:error, "Couldn't find the super cute cat #{id} u.u"}
      cat ->
        {:ok, cat}
    end
  end

  def create_cat(_root, args, _info) do
    case Animals.create_cat(args) do
      {:ok, cat} ->
        {:ok, cat}
      _error ->
        {:error, "Couldn't create the super cute cat: #{args} u.u"}
    end
  end

  def update_cat(_root, %{:id => id, :cat => cat_params}, _info) do
    case Animals.get_cat(id) do
      nil ->
        {:error, "Couldn't find the super cute cat #{id} u.u"}
      cat ->
        case Animals.update_cat(cat, cat_params) do
          {:ok, cat} ->
            {:ok, cat}
          _error ->
            {:error, "Couldn't update the super cute cat: #{cat} to #{cat_params} u.u"}
        end
    end
  end

  def delete_cat(_root, %{:id => id}, _info) do
    case Animals.get_cat(id) do
      nil ->
        {:error, "Couldn't find the super cute cat #{id} u.u"}
      cat ->
        case Animals.delete_cat(cat) do
          {:ok, cat} ->
            {:ok, cat}
          _error ->
            {:error, "Couldn't delete the super cute cat: #{cat} u.u"}
        end
    end
  end

end
