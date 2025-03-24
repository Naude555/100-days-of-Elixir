defmodule GuardClauses do
  @moduledoc """
  This module demonstrates the use of guard clauses in Elixir through various examples.
  Guard clauses are a powerful feature in Elixir that allow you to add additional conditions
  to function definitions, `case` statements, and `cond` expressions.
  """

  # Example 1: Guard clauses in function definitions
  @doc """
  Calculates the square of a given integer.

  ## Parameters
    - `n`: An integer whose square is to be calculated.

  ## Returns
    - The square of the integer if the input is valid.
    - `{:error, "Input must be an integer"}` if the input is not an integer.

  ## Examples

      iex> square(4)
      16

      iex> square("4")
      {:error, "Input must be an integer"}
  """
  def square(n) when is_integer(n) do
    n * n
  end

  def square(_), do: {:error, "Input must be an integer"}


  # Example 2: Multiple function clauses with guards
  @doc """
  Determines whether a number is positive, negative, or zero.

  ## Parameters
    - `n`: An integer to be checked.

  ## Returns
    - `"Positive"` if the number is greater than 0.
    - `"Negative"` if the number is less than 0.
    - `"Zero"` if the number is 0.

  ## Examples

      iex> check_number(5)
      "Positive"

      iex> check_number(-3)
      "Negative"

      iex> check_number(0)
      "Zero"
  """
  def check_number(n) when n > 0, do: "Positive"
  def check_number(n) when n < 0, do: "Negative"
  def check_number(0), do: "Zero"



  # Example 3: Guard clauses in case statements
  @doc """
    Categorizes a person's age into "Child", "Teen", or "Adult".

    ## Parameters
      - `age`: An integer representing a person's age.

    ## Returns
      - "Child" if the age is less than 13.
      - "Teen" if the age is between 13 and 17.
      - "Adult" if the age is 18 or older.

    ## Examples

        iex> age_category(10)
        "Child"

        iex> age_category(16)
        "Teen"

        iex> age_category(25)
        "Adult"
  """
  def age_category(age) do
    case age do
      n when n < 13 -> "Child"
      n when n < 18 -> "Teen"
      _ -> "Adult"
    end
  end


  @doc """
  Determines the temperature feeling based on the given temperature.

  ## Parameters
    - `temp`: An integer representing the temperature in Celsius.

  ## Returns
    - "Freezing" if the temperature is less than 0.
    - "Cold" if the temperature is between 0 and 14.
    - "Warm" if the temperature is between
    - "Hot" if the temperature is 25 or higher.

  ## Examples

      iex> temperature_feeling(-5)
      "Freezing"

      iex> temperature_feeling(10)
      "Cold"

      iex> temperature_feeling(20)
      "Warm"

      iex> temperature_feeling(30)
      "Hot"
  """
  def temperature_feeling(temp) do
    cond do
      temp < 0 -> "Freezing"
      temp < 15 -> "Cold"
      temp < 25 -> "Warm"
      true -> "Hot"
    end
  end
end
