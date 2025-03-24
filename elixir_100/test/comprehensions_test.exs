defmodule ComprehensionsTest do
  use ExUnit.Case
  alias Comprehensions

  test "square_evens_with_comprehension/1 squares even numbers" do
    assert Comprehensions.square_evens_with_comprehension([1, 2, 3, 4]) == [4, 16]
    assert Comprehensions.square_evens_with_comprehension([5, 7, 9]) == []
    assert Comprehensions.square_evens_with_comprehension([]) == []
  end

  test "square_evens_with_enum/1 squares even numbers using Enum functions" do
    assert Comprehensions.square_evens_with_enum([1, 2, 3, 4]) == [4, 16]
    assert Comprehensions.square_evens_with_enum([5, 7, 9]) == []
    assert Comprehensions.square_evens_with_enum([]) == []
  end

  test "generate_key_value_pairs/2 creates key-value pairs from two lists" do
    assert Comprehensions.generate_key_value_pairs([:a, :b, :c], [1, 2, 3]) == [{:a, 1}, {:b, 2}, {:c, 3}]
    assert Comprehensions.generate_key_value_pairs([:a, :b], [1]) == [{:a, 1}]
    assert Comprehensions.generate_key_value_pairs([], []) == []
  end

  test "multiply_pairs/2 generates products of elements from two lists" do
    assert Comprehensions.multiply_pairs([1, 2], [3, 4]) == [3, 4, 6, 8]
    assert Comprehensions.multiply_pairs([1], [5, 6]) == [5, 6]
    assert Comprehensions.multiply_pairs([], [1, 2]) == []
  end

  test "transform_to_map/1 transforms a list of tuples into a map with doubled values" do
    assert Comprehensions.transform_to_map([{:a, 1}, {:b, 2}]) == %{a: 2, b: 4}
    assert Comprehensions.transform_to_map([]) == %{}
    assert Comprehensions.transform_to_map([{:x, 10}]) == %{x: 20}
  end
end
