defmodule Comprehensions do
  @moduledoc """
  This module demonstrates the use of comprehensions in Elixir to perform list operations in a concise and readable way.
  """

  # Example 1: Using comprehensions to square even numbers
  @doc """
  Squares all even numbers in the given list using a comprehension.

  ## Examples

    iex> square_evens_with_comprehension([1, 2, 3, 4])
    [4, 16]

  """
  def square_evens_with_comprehension(numbers) do
    for n <- numbers, rem(n, 2) == 0, do: n * n
  end

  # Example 2: Traditional approach using Enum.filter/2 and Enum.map/2
  @doc """
  Squares all even numbers in the given list using `Enum.filter/2` and `Enum.map/2`.

  ## Examples

    iex> square_evens_with_enum([1, 2, 3, 4])
    [4, 16]

  """
  def square_evens_with_enum(numbers) do
    numbers
    |> Enum.filter(&rem(&1, 2) == 0)
    |> Enum.map(& &1 * &1)
  end

  # Example 3: Using comprehensions to generate key-value pairs
  @doc """
  Generates a map of key-value pairs by zipping two lists together.

  ## Examples

    iex> generate_key_value_pairs([:a, :b, :c], [1, 2, 3])
    %{a: 1, b: 2, c: 3}

  """
  def generate_key_value_pairs(keys, values) do
    for {k, v} <- Enum.zip(keys, values), do: {k, v}
  end

  # Example 4: Using multiple generators to generate products
  @doc """
  Generates a list of products by multiplying each element of the first list
  with each element of the second list using multiple generators.

  ## Examples

    iex> multiply_pairs([1, 2], [3, 4])
    [3, 4, 6, 8]

  """
  def multiply_pairs(list1, list2) do
    for x <- list1, y <- list2, do: x * y
  end


  #Example 5: Using :into option to collect results into a map
  @doc """
  Transforms a list of key-value tuples into a map, doubling the value of each pair.

  ## Examples

    iex> transform_to_map([{:a, 1}, {:b, 2}])
    %{a: 2, b: 4}

  """
  def transform_to_map(list) do
    for {key, value} <- list, into: %{}, do: {key, value * 2}
  end
end
