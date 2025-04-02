defmodule FactoryFunctions do
  @moduledoc """
  This module demonstrates the use of factory functions in Elixir.

  ## Naming Convention
  It is recommended to use `create` instead of `new` when naming factory functions.
  The term `create` explicitly conveys that a new instance of an object is being created,
  making the code more intuitive and easier to understand.

  ## Examples
  - `create_user/1`: Clearly indicates the creation of a new user.
  - `create_admin/1`: Clearly indicates the creation of a new admin.
  - `create_order/1`: Clearly indicates the creation of a new order.
  """

  @doc """
  Creates a new user.

  ## Parameters
  - `name`: The name of the user.

  ## Examples
      iex> FactoryFunctions.create_user("Alice")
      %{name: "Alice"}
  """
  def create_user(name) do
    %{name: name}
  end

  @doc """
  Creates a new admin user.

  ## Parameters
  - `name`: The name of the admin.

  ## Examples
      iex> FactoryFunctions.create_admin("Bob")
      %{name: "Bob", role: :admin}
  """
  def create_admin(name) do
    %{name: name, role: :admin}
  end

  @doc """
  Creates a new order.

  ## Parameters
  - `items`: A list of items in the order.

  ## Examples
      iex> FactoryFunctions.create_order(["item1", "item2"])
      %{items: ["item1", "item2"]}
  """
  def create_order(items) do
    %{items: items}
  end

  @doc """
  Avoid using `new` as a prefix for factory functions.

  ## Why?
  The term `new` is less descriptive and does not explicitly convey that a new instance is being created.

  ## Examples
  - `new_user/1`: Less clear compared to `create_user/1`.
  - `new_admin/1`: Less clear compared to `create_admin/1`.
  - `new_order/1`: Less clear compared to `create_order/1`.
  """
  def new_user(name), do: %{name: name}
  def new_admin(name), do: %{name: name, role: :admin}
  def new_order(items), do: %{items: items}
end
