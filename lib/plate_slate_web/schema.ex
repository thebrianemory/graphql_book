#---
# Excerpted from "Craft GraphQL APIs in Elixir with Absinthe",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/wwgraphql for more book information.
#---
defmodule PlateSlateWeb.Schema do
  use Absinthe.Schema
  alias PlateSlate.{Menu, Repo}

  @desc "The list of available items on the menu"
  query do
    field :menu_items, list_of(:menu_item) do
      resolve fn _, _, _ ->
        {:ok, Repo.all(Menu.Item)}
      end
    end
  end

  object :menu_item do
    @desc "Displays the id of the menu item"
    field :id, :id

    @desc "Displays the name of the menu item"
    field :name, :string

    @desc "Displays the description of the menu item"
    field :description, :string

    @desc "Displays the price of the menu item"
    field :price, :integer
  end
end
