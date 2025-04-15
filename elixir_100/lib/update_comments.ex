defmodule UpdateComments do
  @moduledoc """
  It is crucial to keep comments up-to-date with the code to maintain accuracy and clarity.
  Synchronized comments help prevent misinformation and confusion, making the codebase easier
  to understand and maintain.

  In the good example, the comment correctly describes the current behavior of the code,
  aiding comprehension and collaboration. Conversely, in the bad example, the outdated
  comment misleads readers by describing a previous behavior that no longer matches the
  implementation.
  """

  # Good Code
  @doc """
  This function calculates the factorial of a number using recursion.
  It uses a helper function to handle the recursion and base case.
  """
  def factorial(n) when n < 0 do
    raise ArgumentError, "Negative numbers are not allowed"
  end
  def factorial(0), do: 1
  def factorial(n) do
    factorial_helper(n, 1)
  end
  defp factorial_helper(0, acc), do: acc
  defp factorial_helper(n, acc) when n > 0 do
    factorial_helper(n - 1, n * acc)
  end


  # Bad Code
  @doc """
  This function calculates the factorial of a number.
  By multiplying the number by the factorial of the number minus one
  """
  def factorial_bad(n) when n < 0 do
    raise ArgumentError, "Negative numbers are not allowed"
  end

  def factorial_bad(0), do: 1
  def factorial_bad(n) do
    factorial_helper(n, 1)
  end
  defp factorial_helper(0, acc), do: acc
  defp factorial_helper(n, acc) when n > 0 do
    factorial_helper(n - 1, n * acc)
  end
end
