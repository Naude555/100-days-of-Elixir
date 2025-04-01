defmodule ReturningBooleansTest do
  use ExUnit.Case
  alias ReturningBooleans

  describe "valid?/1" do
    test "returns true when email contains '@'" do
      assert ReturningBooleans.valid?(%{email: "user@example.com"}) == true
    end

    test "returns false when email does not contain '@'" do
      assert ReturningBooleans.valid?(%{email: "userexample.com"}) == false
    end

    test "returns false when email key is missing" do
      assert ReturningBooleans.valid?(%{}) == false
    end
  end

  describe "admin?/1" do
    test "returns true when user role is :admin" do
      assert ReturningBooleans.admin?(%{role: :admin}) == true
    end

    test "returns false when user role is not :admin" do
      assert ReturningBooleans.admin?(%{role: :user}) == false
    end

    test "returns false when role key is missing" do
      assert ReturningBooleans.admin?(%{}) == false
    end
  end

  describe "even?/1" do
    test "returns true for even numbers" do
      assert ReturningBooleans.even?(4) == true
    end

    test "returns false for odd numbers" do
      assert ReturningBooleans.even?(5) == false
    end
  end

  describe "empty?/1" do
    test "returns true for an empty list" do
      assert ReturningBooleans.empty?([]) == true
    end

    test "returns false for a non-empty list" do
      assert ReturningBooleans.empty?([1, 2, 3]) == false
    end
  end
end
