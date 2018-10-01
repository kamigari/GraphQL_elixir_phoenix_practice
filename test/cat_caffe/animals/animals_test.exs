defmodule CatCaffe.AnimalsTest do
  use CatCaffe.DataCase

  alias CatCaffe.Animals

  describe "cats" do
    alias CatCaffe.Animals.Cat

    @valid_attrs %{description: "some description", name: "some name", owner: "some owner"}
    @update_attrs %{description: "some updated description", name: "some updated name", owner: "some updated owner"}
    @invalid_attrs %{description: nil, name: nil, owner: nil}

    def cat_fixture(attrs \\ %{}) do
      {:ok, cat} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Animals.create_cat()

      cat
    end

    test "list_cats/0 returns all cats" do
      cat = cat_fixture()
      assert Animals.list_cats() == [cat]
    end

    test "get_cat!/1 returns the cat with given id" do
      cat = cat_fixture()
      assert Animals.get_cat!(cat.id) == cat
    end

    test "create_cat/1 with valid data creates a cat" do
      assert {:ok, %Cat{} = cat} = Animals.create_cat(@valid_attrs)
      assert cat.description == "some description"
      assert cat.name == "some name"
      assert cat.owner == "some owner"
    end

    test "create_cat/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Animals.create_cat(@invalid_attrs)
    end

    test "update_cat/2 with valid data updates the cat" do
      cat = cat_fixture()
      assert {:ok, cat} = Animals.update_cat(cat, @update_attrs)
      assert %Cat{} = cat
      assert cat.description == "some updated description"
      assert cat.name == "some updated name"
      assert cat.owner == "some updated owner"
    end

    test "update_cat/2 with invalid data returns error changeset" do
      cat = cat_fixture()
      assert {:error, %Ecto.Changeset{}} = Animals.update_cat(cat, @invalid_attrs)
      assert cat == Animals.get_cat!(cat.id)
    end

    test "delete_cat/1 deletes the cat" do
      cat = cat_fixture()
      assert {:ok, %Cat{}} = Animals.delete_cat(cat)
      assert_raise Ecto.NoResultsError, fn -> Animals.get_cat!(cat.id) end
    end

    test "change_cat/1 returns a cat changeset" do
      cat = cat_fixture()
      assert %Ecto.Changeset{} = Animals.change_cat(cat)
    end
  end
end
