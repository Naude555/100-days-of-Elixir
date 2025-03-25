defmodule ProtocolsPolymorphicTest do
  use ExUnit.Case
  alias ProtocolsPolymorphic.{Stringify, Summable}

  describe "Stringify protocol" do
    test "converts integer to string" do
      assert Stringify.to_string(123) == "123"
    end

    test "converts list to string" do
      assert Stringify.to_string([1, 2, 3]) == "1, 2, 3"
    end

    test "converts tuple to string" do
      assert Stringify.to_string({:ok, 42}) == "ok, 42"
    end

    test "converts map to string" do
      assert Stringify.to_string(%{a: 1, b: 2}) == "a: 1, b: 2"
    end

    test "converts atom to string" do
      assert Stringify.to_string(:example_atom) == "example_atom"
    end
  end

  describe "Summable protocol" do
    test "calculates sum of a list" do
      assert Summable.sum([1, 2, 3, 4]) == 10
    end

    test "calculates sum of a tuple" do
      assert Summable.sum({1, 2, 3, 4}) == 10
    end

    test "calculates sum of a map (values only)" do
      assert Summable.sum(%{a: 1, b: 2, c: 3}) == 6
    end

    test "returns the integer itself as sum" do
      assert Summable.sum(42) == 42
    end
  end
end
