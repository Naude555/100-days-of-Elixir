defmodule PluralNouns do
  @moduledoc """
  This module demonstrates the importance of using plural nouns for collections in your code.
  Always name collections with plural nouns to clearly indicate that the variable holds multiple items.
  Using plural nouns for collections is a common practice in many programming languages, not just Elixir, as it greatly aids in code clarity and comprehension.
  """

  @doc """
  Good Naming Practices
  The following functions demonstrate good naming practices:
    It uses plural nouns for collections to indicate that the variable holds multiple items.
  """
  def get_users() do
    ["Alice", "Bob", "Charlie"]
  end

  def get_items() do
    ["Apple", "Banana", "Cherry"]
  end

  def get_orders() do
    ["Order 1", "Order 2", "Order 3"]
  end

  def get_products() do
    ["Product A", "Product B", "Product C"]
  end

  def list_items() do
    ["Item 1", "Item 2", "Item 3"]
  end

  def add_item(items, item) do
    [item | items]
  end

  @doc """
  Bad Naming Practices
  The following functions demonstrate poor naming practices:
    It uses singular nouns for collections, which can be misleading and confusing.
  """
  def get_user() do
    ["Alice", "Bob", "Charlie"]
  end

  def get_item() do
    ["Apple", "Banana", "Cherry"]
  end

  def get_order() do
    ["Order 1", "Order 2", "Order 3"]
  end

  def get_product() do
    ["Product A", "Product B", "Product C"]
  end

  def list_item() do
    ["Item 1", "Item 2", "Item 3"]
  end

  def add_items(items, item) do
    [item | items]
  end

end
