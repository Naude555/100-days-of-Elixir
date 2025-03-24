defmodule PipeOperator do
  @moduledoc """
  A module demonstrating the use of the Elixir pipe operator (`|>`)
  compared to traditional function composition. This module provides
  examples of transforming strings, performing arithmetic operations
  on lists, filtering and mapping lists, and extracting data from strings.
  """

  # Example 1: Transforming strings
  @doc """
  Converts a string to uppercase and then reverses it.

  ## Examples

      iex> PipeOperator.transform_string_pipe("hello")
      "OLLEH"

      iex> PipeOperator.transform_string_no_pipe("world")
      "DLROW"
  """
  def transform_string_pipe(str) do
    str
    |> String.upcase()
    |> String.reverse()
  end

  def transform_string_no_pipe(str) do
    String.reverse(String.upcase(str))
  end


  # Example 2: Performing arithmetic operations on lists
  @doc """
  Sums all elements in a list and doubles the result.

  ## Examples

      iex> PipeOperator.sum_and_double_pipe([1, 2, 3])
      12

      iex> PipeOperator.sum_and_double_no_pipe([4, 5, 6])
      30
  """
  def sum_and_double_pipe(list) do
    list
    |> Enum.sum()
    |> Kernel.*(2)
  end

  def sum_and_double_no_pipe(list) do
    Kernel.*(Enum.sum(list), 2)
  end

  # Example 3: Filtering and mapping lists
  @doc """
  Filters even numbers from a list and squares each of them.

  ## Examples

      iex> PipeOperator.filter_and_square_pipe([1, 2, 3, 4])
      [4, 16]

      iex> PipeOperator.filter_and_square_no_pipe([5, 6, 7, 8])
      [36, 64]
  """
  def filter_and_square_pipe(list) do
    list
    |> Enum.filter(&rem(&1, 2) == 0)
    |> Enum.map(& &1 * &1)
  end

  def filter_and_square_no_pipe(list) do
    Enum.map(Enum.filter(list, fn x -> rem(x, 2) == 0 end), fn x -> x * x end)
  end

  # Example 4: Extracting data from strings
  @doc """
  Extracts the first word from a given sentence.

  ## Examples

      iex> PipeOperator.first_word_pipe("Hello world!")
      "Hello"

      iex> PipeOperator.first_word_no_pipe("Elixir is awesome")
      "Elixir"
  """
  def first_word_pipe(sentence) do
    sentence
    |> String.split()
    |> List.first()
  end

  def first_word_no_pipe(sentence) do
    List.first(String.split(sentence))
  end
end
