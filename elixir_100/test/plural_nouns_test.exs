defmodule PluralNounsTest do
  use ExUnit.Case
  alias PluralNouns

  describe "Good Naming Practices" do
    test "get_users/0 returns a list of users" do
      assert PluralNouns.get_users() == ["Alice", "Bob", "Charlie"]
    end

    test "get_items/0 returns a list of items" do
      assert PluralNouns.get_items() == ["Apple", "Banana", "Cherry"]
    end

    test "get_orders/0 returns a list of orders" do
      assert PluralNouns.get_orders() == ["Order 1", "Order 2", "Order 3"]
    end

    test "get_products/0 returns a list of products" do
      assert PluralNouns.get_products() == ["Product A", "Product B", "Product C"]
    end

    test "list_items/0 returns a list of items" do
      assert PluralNouns.list_items() == ["Item 1", "Item 2", "Item 3"]
    end

    test "add_item/2 adds an item to the list" do
      assert PluralNouns.add_item(["Item 1", "Item 2"], "Item 3") == ["Item 3", "Item 1", "Item 2"]
    end
  end

  describe "Bad Naming Practices" do
    test "get_user/0 returns a list of users" do
      assert PluralNouns.get_user() == ["Alice", "Bob", "Charlie"]
    end

    test "get_item/0 returns a list of items" do
      assert PluralNouns.get_item() == ["Apple", "Banana", "Cherry"]
    end

    test "get_order/0 returns a list of orders" do
      assert PluralNouns.get_order() == ["Order 1", "Order 2", "Order 3"]
    end

    test "get_product/0 returns a list of products" do
      assert PluralNouns.get_product() == ["Product A", "Product B", "Product C"]
    end

    test "list_item/0 returns a list of items" do
      assert PluralNouns.list_item() == ["Item 1", "Item 2", "Item 3"]
    end

    test "add_items/2 adds an item to the list" do
      assert PluralNouns.add_items(["Item 1", "Item 2"], "Item 3") == ["Item 3", "Item 1", "Item 2"]
    end
  end
end
