defmodule VerbNounTest do
  use ExUnit.Case
  alias VerbNoun

  describe "Bad Naming Practices" do
    test "total/1 calculates the total price of items in a cart" do
      cart = [%{price: 10}, %{price: 20}, %{price: 30}]
      assert VerbNoun.total(cart) == 60
    end

    test "user/1 fetches user details by ID" do
      {:ok, user} = VerbNoun.user(1)
      assert user == %{id: 1, name: "John Doe"}
    end
  end

  describe "Good Naming Practices" do
    test "calculate_total/1 calculates the total price of items in a cart" do
      cart = [%{price: 10}, %{price: 20}, %{price: 30}]
      assert VerbNoun.calculate_total(cart) == 60
    end

    test "fetch_user_details/1 fetches user details by ID" do
      {:ok, user} = VerbNoun.fetch_user_details(1)
      assert user == %{id: 1, name: "John Doe"}
    end
  end
end
