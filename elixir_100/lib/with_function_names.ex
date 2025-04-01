defmodule WithFunctionNames do
  @moduledoc """
  ## Using 'with' in Function Names for Clarity

  When naming functions, using the prefix `with_` can indicate that the function returns a modified version of its input. This naming convention improves code readability and helps developers quickly understand the purpose of the function without needing to inspect its implementation.

  ### Why It's Good:
  1. **Descriptive Naming**: The `with_` prefix explicitly conveys that the function modifies and returns the input.
  2. **Improved Readability**: Developers can infer the function's behavior from its name, making the code more intuitive.
  3. **Self-Documenting Code**: Clear function names reduce the need for additional comments or documentation.

  Using the `with_` prefix in function names makes your code more descriptive, readable, and intuitive. It helps other developers quickly understand the purpose of your functions and reduces ambiguity in your codebase.
  ### Example: Adding a Timestamp
  Compare the following two functions:

  """

  @doc """
  #### Good Example: `with_timestamp/1`
  The name `with_timestamp` clearly indicates that the function returns the input with an added timestamp.
  """
  def with_timestamp(user) do
    timestamp = DateTime.utc_now()
    Map.put(user, :timestamp, timestamp)
  end

  @doc """
  #### Bad Example: `add_timestamp/1`
  The name `add_timestamp` is less clear because it does not explicitly convey that the input is returned with modifications.
  """
  def add_timestamp(user) do
    timestamp = DateTime.utc_now()
    Map.put(user, :timestamp, timestamp)
  end

  @doc """
  ### Additional Examples

  #### Example 1: Adding a Role to a User

  Good: `with_role/2`
  """
  def with_role(user, role) do
    Map.put(user, :role, role)
  end

  @doc """
  Bad: `assign_role/2`
  """
  def assign_role(user, role) do
    Map.put(user, :role, role)
  end

  @doc """
  #### Example 2: Updating a List of Items

  Good: `with_item_added/2`
  """
  def with_item_added(list, item) do
    list ++ [item]
  end

  @doc """
  Bad: `add_item/2`
  """
  def add_item(list, item) do
    list ++ [item]
  end

end
