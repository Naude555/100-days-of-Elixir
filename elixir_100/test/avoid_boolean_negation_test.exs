defmodule TestAvoidBooleanNegation do
  use ExUnit.Case
  doctest AvoidBooleanNegation

  describe "valid?/1" do
    test "returns true when user has both name and email" do
      user = %{name: "John", email: "john@example.com"}
      assert AvoidBooleanNegation.valid?(user) == true
    end

    test "returns false when user has no name" do
      user = %{name: nil, email: "john@example.com"}
      assert AvoidBooleanNegation.valid?(user) == false
    end

    test "returns false when user has no email" do
      user = %{name: "John", email: nil}
      assert AvoidBooleanNegation.valid?(user) == false
    end
  end

  describe "admin?/1" do
    test "returns true when user role is :admin" do
      user = %{role: :admin}
      assert AvoidBooleanNegation.admin?(user) == true
    end

    test "returns false when user role is not :admin" do
      user = %{role: :regular}
      assert AvoidBooleanNegation.admin?(user) == false
    end
  end

  describe "not_invalid?/1" do
    test "returns true when user has both name and email" do
      user = %{name: "John", email: "john@example.com"}
      assert AvoidBooleanNegation.not_invalid?(user) == true
    end

    test "returns false when user has no name" do
      user = %{name: nil, email: "john@example.com"}
      assert AvoidBooleanNegation.not_invalid?(user) == false
    end

    test "returns false when user has no email" do
      user = %{name: "John", email: nil}
      assert AvoidBooleanNegation.not_invalid?(user) == false
    end
  end

  describe "not_regular?/1" do
    test "returns true when user role is not :regular" do
      user = %{role: :admin}
      assert AvoidBooleanNegation.not_regular?(user) == true
    end

    test "returns false when user role is :regular" do
      user = %{role: :regular}
      assert AvoidBooleanNegation.not_regular?(user) == false
    end
  end
end
