defmodule Calculate do
  @moduledoc """
  The `Calculate` module provides functions for performing basic mathematical operations
  with a focus on improving code readability and clarity. By using descriptive and
  action-oriented function names, this module aims to make the purpose of each function
  immediately clear to developers.

  ## Purpose
  - To demonstrate the importance of choosing meaningful and descriptive function names.
  - To highlight the difference between clear and ambiguous naming conventions in code.

  ## Functions
  - `calculate_sum/2`: Adds two numbers and returns their sum.
  - `calculate_difference/2`: Subtracts the second number from the first and returns the result.
  - `compute_sum/2`: A less clear alternative to `calculate_sum/2` (provided as an example of poor naming).
  - `compute_difference/2`: A less clear alternative to `calculate_difference/2` (provided as an example of poor naming).
  """

  @doc """
  Adds two numbers and returns their sum.

  ## Examples

      iex> Calculate.calculate_sum(3, 5)
      8
  """
  def calculate_sum(a, b) do
    a + b
  end

  @doc """
  Subtracts the second number from the first and returns the result.

  ## Examples

      iex> Calculate.calculate_difference(10, 5)
      5
  """
  def calculate_difference(a, b) do
    a - b
  end

  @doc """
  A less clear alternative to `calculate_sum/2`. The name `compute_sum` does not explicitly
  convey that the function returns the sum of two numbers, making it harder to understand
  the function's purpose at a glance.

  ## Examples

      iex> Calculate.compute_sum(3, 5)
      8
  """
  def compute_sum(a, b) do
    a + b
  end

  @doc """
  A less clear alternative to `calculate_difference/2`. The name `compute_difference` does
  not explicitly convey that the function returns the difference between two numbers,
  reducing code readability.

  ## Examples

      iex> Calculate.compute_difference(10, 5)
      5
  """
  def compute_difference(a, b) do
    a - b
  end
end
