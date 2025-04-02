defmodule AvoidBooleanNegation do
  @moduledoc """
  Avoid negations in boolean names, e.g., use `is_valid?` instead of `is_not_invalid?`.
  Using positive terms for boolean names enhances readability and reduces confusion.

  When naming boolean variables, it is best to use positive terms instead of negative terms, as it makes the code more intuitive.

  ### Good Practices
  - Use positive terms like `is_valid?` or `is_admin?` to clearly express the intent of the function.
  - Use the `?` suffix for functions that return booleans, as it is idiomatic in Elixir and improves readability.

  ### Why `is_admin?` is Good
  The function `is_admin?/1` is a good example of idiomatic Elixir naming. It uses the `?` suffix to indicate that it returns a boolean value, which aligns with Elixir conventions. This makes the code more expressive and easier to understand.

  ### Why `admin?/1` is Better for Boolean Checks
  While `is_admin?/1` is acceptable, Elixir encourages concise and expressive naming. The function name `admin?/1` is preferred because it avoids the redundant `is_` prefix, which is unnecessary in Elixir. The `?` suffix already conveys that the function checks a condition and returns a boolean.
  """

  @doc """
  Checks if the user is valid.

  A user is considered valid if both the `name` and `email` fields are not `nil`.

  ## Examples

      iex> user = %{name: "John", email: "john@example.com"}
      iex> AvoidBooleanNegation.valid?(user)
      true

      iex> user = %{name: nil, email: "john@example.com"}
      iex> AvoidBooleanNegation.valid?(user)
      false

  """
  def valid?(user) do
    user.name != nil and user.email != nil
  end

  @doc """
  Checks if the user is an admin.

  A user is considered an admin if their `role` is `:admin`.

  ## Examples

      iex> user = %{role: :admin}
      iex> AvoidBooleanNegation.admin?(user)
      true

      iex> user = %{role: :regular}
      iex> AvoidBooleanNegation.admin?(user)
      false

  """
  def admin?(user) do
    user.role == :admin
  end

  @doc """
  Avoid using negations in function names.

  This function demonstrates a bad practice by using a negation in the name.
  Instead, prefer positive and concise names like `valid?/1`.

  ## Examples

      iex> user = %{name: "John", email: "john@example.com"}
      iex> AvoidBooleanNegation.not_invalid?(user)
      true

  """
  def not_invalid?(user) do
    user.name != nil and user.email != nil
  end

  @doc """
  Avoid using negations in function names.

  This function demonstrates a bad practice by using a negation in the name.
  Instead, prefer positive and concise names like `admin?/1`.

  ## Examples

      iex> user = %{role: :regular}
      iex> AvoidBooleanNegation.not_regular?(user)
      false

  """
  def not_regular?(user) do
    user.role != :regular
  end

end
