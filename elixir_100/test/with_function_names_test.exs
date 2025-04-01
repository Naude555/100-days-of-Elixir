defmodule WithFunctionNamesTest do
  use ExUnit.Case
  alias WithFunctionNames

  describe "with_timestamp/1" do
    test "adds a timestamp to the user map" do
      user = %{name: "Alice"}
      result = WithFunctionNames.with_timestamp(user)
      assert Map.has_key?(result, :timestamp)
      assert result.name == "Alice"
    end
  end

  describe "add_timestamp/1" do
    test "adds a timestamp to the user map (bad example)" do
      user = %{name: "Bob"}
      result = WithFunctionNames.add_timestamp(user)
      assert Map.has_key?(result, :timestamp)
      assert result.name == "Bob"
    end
  end

  describe "with_role/2" do
    test "adds a role to the user map" do
      user = %{name: "Alice"}
      result = WithFunctionNames.with_role(user, "admin")
      assert result.role == "admin"
      assert result.name == "Alice"
    end
  end

  describe "assign_role/2" do
    test "adds a role to the user map (bad example)" do
      user = %{name: "Bob"}
      result = WithFunctionNames.assign_role(user, "user")
      assert result.role == "user"
      assert result.name == "Bob"
    end
  end

  describe "with_item_added/2" do
    test "adds an item to the list" do
      list = [1, 2, 3]
      result = WithFunctionNames.with_item_added(list, 4)
      assert result == [1, 2, 3, 4]
    end
  end

  describe "add_item/2" do
    test "adds an item to the list (bad example)" do
      list = [:a, :b, :c]
      result = WithFunctionNames.add_item(list, :d)
      assert result == [:a, :b, :c, :d]
    end
  end
end
