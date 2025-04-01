defmodule ReturningBooleans do
  @moduledoc """
  In Elixir, it's a common convention to suffix boolean-returning functions with a question mark (`?`).
  This practice enhances code readability and clarity by signaling to the reader that the function's purpose
  is to answer a yes/no question.

  ### Why Use `?` for Boolean Functions?
  Appending a question mark to function names that return a boolean value makes the code more intuitive.
  It clearly communicates that the function performs a check and returns `true` or `false`.

  ### Why Use `is_` for Boolean Variables?
  While functions in Elixir use the `?` suffix for boolean-returning checks, boolean variables often use
  the `is_` prefix to indicate their purpose. For example, a variable like `is_admin` or `is_valid`
  clearly communicates that it holds a boolean value. This is a common convention in many programming
  languages, as it makes the code more descriptive and easier to understand.

  ### Can These Conventions Be Combined?
  No, these conventions are typically not combined in Elixir. The `is_` prefix is used for variables,
  while the `?` suffix is used for functions. Mixing these conventions would reduce clarity and go against
  idiomatic Elixir practices. For example:

  - A variable named `is_admin` is clear and descriptive.
  - A function named `admin?/1` is idiomatic and signals that it performs a check.
  - A function named `is_admin/1` is less idiomatic and redundant, as the `?` suffix already implies a boolean return value.

  ### Examples
  - **Good Code**: `valid?/1` clearly communicates its purpose: to check a condition and return a boolean.
  - **Bad Code**: `is_valid/1`, while functional, is less idiomatic and slightly less clear in Elixir.
  """

  @doc """
  Good Example: `valid?/1`
  Checks if the user's email contains an "@" symbol.
  """
  def valid?(user) do
    case Map.fetch(user, :email) do
      {:ok, email} -> String.contains?(email, "@")
      :error -> false
    end
  end

  @doc """
  Bad Example: `is_valid/1`
  The name `is_valid` is less clear because it does not explicitly convey that the function returns a boolean value.
  """
  def is_valid(user) do
    case Map.fetch(user, :email) do
      {:ok, email} -> String.contains?(email, "@")
      :error -> false
    end
  end

  @doc """
  Good Example: `admin?/1`
  Checks if the user has an admin role.
  """
  def admin?(user) do
    user[:role] == :admin
  end

  @doc """
  Bad Example: `is_admin/1`
  The name `is_admin` is less idiomatic in Elixir.
  """
  def is_admin(user) do
    user[:role] == :admin
  end

  @doc """
  Good Example: `even?/1`
  Checks if a number is even.
  """
  def even?(number) do
    rem(number, 2) == 0
  end

  @doc """
  Bad Example: `is_even/1`
  The name `is_even` is less idiomatic in Elixir.
  """
  def is_even(number) do
    rem(number, 2) == 0
  end

  @doc """
  Good Example: `empty?/1`
  Checks if a list is empty.
  """
  def empty?(list) do
    list == []
  end

  @doc """
  Bad Example: `is_empty/1`
  The name `is_empty` is less idiomatic in Elixir.
  """
  def is_empty(list) do
    list == []
  end
end
