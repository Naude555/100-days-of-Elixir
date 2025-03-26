defmodule VerbNoun do
  @moduledoc """
  This module demonstrates the differences between good and bad function naming practices using verb-noun naming conventions.

  ## Why Use Verb-Noun Combinations?
  Using **verb-noun combinations** for function names improves code readability and maintainability by clearly describing:
  - **The action being performed** (verb).
  - **The subject of the action** (noun).

  This practice creates **self-documenting code**, making it easier for developers to understand the purpose of a function at a glance.
  """

  # Section: Bad Naming Practices
  @doc """
  ### Why It’s Bad:
  1. **Ambiguous Names**: Names like `total` and `user` are vague and do not indicate the function's purpose.
  2. **Lack of Action**: There’s no verb to describe what the function does.
  3. **Harder to Understand**: Developers may need to read the function's implementation to understand its purpose.
  """
  # Function names without clear verb-noun combinations
  def total(cart) do
    Enum.reduce(cart, 0, fn item, acc -> acc + item.price end)
  end

  def user(user_id) do
    # Imagine this function fetches user details from a database
    {:ok, %{id: user_id, name: "John Doe"}}
  end

  # Usage examples for bad naming practices
  def bad_usage_examples do
    cart = [%{price: 10}, %{price: 20}, %{price: 30}]
    IO.puts total(cart)  # Output: 60

    {:ok, user} = user(1)
    IO.inspect user  # Output: %{id: 1, name: "John Doe"}
  end

  # Section: Good Naming Practices
  @doc """
  ### Why It’s Good:
  1. **Descriptive Names**: Functions like `calculate_total` and `fetch_user_details` clearly describe their purpose.
  2. **Action-Oriented**: The verb indicates what the function does (e.g., "calculate", "fetch").
  3. **Readable and Maintainable**: Other developers can quickly understand the function's intent without needing additional comments.
  """
  # Function to calculate the total price of items in a cart
  def calculate_total(cart) do
    Enum.reduce(cart, 0, fn item, acc -> acc + item.price end)
  end

  # Function to fetch user details by ID
  def fetch_user_details(user_id) do
    # Imagine this function fetches user details from a database
    {:ok, %{id: user_id, name: "John Doe"}}
  end

  # Usage examples for good naming practices
  def good_usage_examples do
    cart = [%{price: 10}, %{price: 20}, %{price: 30}]
    IO.puts calculate_total(cart)  # Output: 60

    {:ok, user} = fetch_user_details(1)
    IO.inspect user  # Output: %{id: 1, name: "John Doe"}
  end
end
