defmodule FactoryFunctionsTest do
  use ExUnit.Case
  doctest FactoryFunctions

  describe "create_user/1" do
    test "creates a user with the given name" do
      assert FactoryFunctions.create_user("Alice") == %{name: "Alice"}
    end
  end

  describe "create_admin/1" do
    test "creates an admin with the given name and role" do
      assert FactoryFunctions.create_admin("Bob") == %{name: "Bob", role: :admin}
    end
  end

  describe "create_order/1" do
    test "creates an order with the given items" do
      assert FactoryFunctions.create_order(["item1", "item2"]) == %{items: ["item1", "item2"]}
    end
  end

  describe "new_user/1" do
    test "creates a user with the given name (discouraged usage)" do
      assert FactoryFunctions.new_user("Alice") == %{name: "Alice"}
    end
  end

  describe "new_admin/1" do
    test "creates an admin with the given name and role (discouraged usage)" do
      assert FactoryFunctions.new_admin("Bob") == %{name: "Bob", role: :admin}
    end
  end

  describe "new_order/1" do
    test "creates an order with the given items (discouraged usage)" do
      assert FactoryFunctions.new_order(["item1", "item2"]) == %{items: ["item1", "item2"]}
    end
  end
end
