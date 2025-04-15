defmodule RedundantComments do
  @moduledoc """
  This module demonstrates the importance of avoiding redundant comments in code.
  Redundant comments can clutter the codebase and make it harder to read and maintain.
  Instead, focus on writing clear and self-explanatory code that minimizes the need for comments.
  In the good example, the code is clear and concise, making it easy to understand without unnecessary comments.
  In the bad example, the comments are redundant and do not add value, making the code harder to read.
  """

  # Good Code
  @doc """
  Convert fahrenheit to celsius.
  """
  @spec fahrenheit_to_celsius(float) :: float
  def fahrenheit_to_celsius(fahrenheit) do
    # Convert fahrenheit to celsius
    (fahrenheit - 32) * 5 / 9
  end
  # Bad Code
  @doc """
  Convert fahrenheit to celsius.
  """
  def fahrenheit_to_celsius_bad(fahrenheit) do
    # This function converts fahrenheit to celsius
    # The formula is (fahrenheit - 32) * 5 / 9
    (fahrenheit - 32) * 5 / 9
  end
end
