defmodule PatternMatching do
  @moduledoc """
  This module demonstrates various examples of pattern matching in Elixir,
  including matching tuples, lists, maps, and function parameters. It also
  highlights the importance of using pattern matching effectively instead of
  relying on conditional constructs like `case` or `if-else`.

  ## Examples

  ### Basic Pattern Matching
  The `basic_example/0` function demonstrates how to destructure a tuple into variables.

  ### Matching Function Parameters
  The `describe/1` function shows how to match specific tuple patterns in function heads
  to handle different cases, such as `{:ok, value}` or `{:error, reason}`.

  ### Matching Lists
  The `list_example/1` function demonstrates how to use the `[head | tail]` pattern to
  extract the head and tail of a list. The `list_example2/0` function shows how to
  destructure a list into individual elements.

  ### Matching Maps
  The `get_name/1` function demonstrates how to match a map with a specific key
  and extract its value.

  ### Matching Tuples
  The `tuple_example/0` function provides another example of destructuring a tuple
  into individual variables.

  ### Avoiding Unnecessary Conditionals
  The `bad_describe/1` function illustrates a less efficient way of handling tuple
  patterns using a `case` statement. The `better_describe/1` function demonstrates
  a cleaner and more idiomatic approach using pattern matching in function heads.

  ## Usage
  This module is intended to serve as a learning resource for understanding and
  applying pattern matching in Elixir. Each function includes examples of common
  patterns and best practices.
  """

  # Example 1 - Basic Pattern Matching
  def basic_example do
    {a, b, c} = {1, 2, 3}
    IO.puts "a: #{a}, b: #{b}, c: #{c}"
  end

  # Example 2 - Matching Function Parameters
  def describe({:ok, value}) do
    IO.puts "The value is #{value}"
  end

  def describe({:error, reason}) do
    IO.puts "An error occurred: #{reason}"
  end

  # Example 3 - Matching Lists
  def list_example([head | tail]) do
    IO.puts "Head: #{head}, Tail: #{inspect(tail)}"
  end

  def list_example2 do
    [a, b, c] = [1, 2, 3]
    IO.puts "a: #{a}, b: #{b}, c: #{c}"
  end

  # Example 4 - Matching Maps
  def get_name(%{name: name}) do
    IO.puts "Name: #{name}"
  end


  # Example 5 - Matching Tuples
  def tuple_example do
    {a, b, c} = {1, 2, 3}
    IO.puts "a: #{a}, b: #{b}, c: #{c}"
  end


  # Bad Code: Using case or if-else unnecessarily
  def bad_describe(tuple) do
    case tuple do
      {:ok, value} -> IO.puts "The value is #{value}"
      {:error, reason} -> IO.puts "An error occurred: #{reason}"
      _ -> IO.puts "Invalid tuple"
    end
  end

  # Better Code: Using pattern matching
  def better_describe({:ok, value}), do: IO.puts "The value is #{value}"
  def better_describe({:error, reason}), do: IO.puts "An error occurred: #{reason}"
  def better_describe(_), do: IO.puts "Invalid tuple"

end
