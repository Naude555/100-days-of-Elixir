defmodule Fetch do
  @moduledoc """
  Use fetch instead of get for operations that might fail.
  'Fetch' implies that the operation may not succeed and
  usually involves error handling, which makes the code's
  intent clearer compared to using 'get'.
  In Elixir, many standard library functions use 'fetch' to
  indicate potential failure and return {, value} ortuples, while

  'get' typically returns the value directly or a default if not
  found. This convention helps in writing robust error-handling
  code.

  ## Why use `fetch` over `get`?

  Using `fetch` makes it explicit that the operation may fail and provides a clear mechanism for handling errors. This approach leads to more robust and maintainable code by encouraging developers to handle failure cases explicitly.

  ## Examples of `fetch` vs `get`

  ### Fetch Example:

      iex> Fetch.fetch_user_by_index(0)
      {:ok, "Alice"}

      iex> Fetch.fetch_user_by_index(3)
      {:error, "Index out of bounds"}

  ### Get Example:

      iex> Fetch.get_user_by_index(0)
      "Alice"

      iex> Fetch.get_user_by_index(3)
      nil

  ### Why is `fetch` better?

  - **Error Handling**: `fetch` returns a tuple with `:ok` or `:error`, making it easier to handle errors explicitly.
  - **Code Clarity**: The intent of the function is clearer when using `fetch`, as it signals that the operation may fail.
  - **Avoiding Silent Failures**: Using `get` can lead to silent failures (e.g., returning `nil`), which may cause bugs that are harder to debug.

  ## When to use `fetch`?

  Use `fetch` whenever the operation involves accessing data that may not exist or may fail due to external conditions. This is especially useful in scenarios like:

  - Accessing elements in a list or map by index or key.
  - Fetching data from external APIs or databases.
  - Performing operations where the result is not guaranteed to succeed.
  """

  @doc """
  Good Code: `fetch_user_by_index/1`

  ## Example

      iex> Fetch.fetch_user_by_index(1)
      {:ok, "Bob"}

      iex> Fetch.fetch_user_by_index(10)
      {:error, "Index out of bounds"}
  """
  def fetch_user_by_index(index) do
    users = ["Alice", "Bob", "Charlie"]

    case Enum.at(users, index) do
      nil -> {:error, "Index out of bounds"}
      user -> {:ok, user}
    end
  end

  @doc """
  Bad Code: `get_user_by_index/1`

  ## Example

      iex> Fetch.get_user_by_index(1)
      "Bob"

      iex> Fetch.get_user_by_index(10)
      nil
  """
  def get_user_by_index(index) do
    users = ["Alice", "Bob", "Charlie"]
    Enum.at(users, index)
  end
end
