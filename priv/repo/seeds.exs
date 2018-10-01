# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CatCaffe.Repo.insert!(%CatCaffe.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias CatCaffe.Animals.Cat
alias CatCaffe.Repo

%Cat{:name => "Lina", :owner => "Kamigari", :description => "Super cute AF"} |> Repo.insert!
%Cat{:name => "Nyx", :owner => "Conde", :description => "Tiny lil teddy"} |> Repo.insert!
