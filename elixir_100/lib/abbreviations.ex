defmodule Abbreviations do
  @moduledoc """
  Use full words instead of abbreviations to enhance code readability.
  Choosing descriptive names helps in understanding the code without needing extra context.
  This is especially important for people who might not be familiar with the abbreviations used.
  Consistent naming conventions and avoiding abbreviations can significantly reduce the cognitive load on developers,
  making it easier to maintain and extend the codebase.

  ## Why Avoid Abbreviations?

  - **Improved Readability**: Full words make the code self-explanatory.
  - **Ease of Collaboration**: Team members can understand the code without needing to decipher abbreviations.
  - **Future Maintenance**: Code is easier to maintain when it's clear and descriptive.

  """

  @doc """
  Fetches a user by their index in the list.

  ## Parameters
  - `index`: The position of the user in the list.

  ## Examples

      iex> Abbreviations.fetch_user_by_index(1)
      "Bob"
  """
  def fetch_user_by_index(index) do
    users = ["Alice", "Bob", "Charlie"]
    Enum.at(users, index)
  end

  @doc """
  Updates the user's information by adding a timestamp.

  ## Parameters
  - `user`: A map representing the user.

  ## Examples

      iex> user = %{name: "Alice"}
      iex> Abbreviations.update_user_information(user)
      %{name: "Alice", updated_at: ~U[2023-01-01T00:00:00Z]}
  """
  def update_user_information(user) do
    user
    |> Map.put(:updated_at, DateTime.utc_now())
  end

  @doc """
  Fetches a user by their index in the list (bad example).

  ## Parameters
  - `index`: The position of the user in the list.

  ## Examples

      iex> Abbreviations.fetch_usr_by_idx(1)
      "Bob"
  """
  def fetch_usr_by_idx(index) do
    users = ["Alice", "Bob", "Charlie"]
    Enum.at(users, index)
  end

  @doc """
  Updates the user's information by adding a timestamp (bad example).

  ## Parameters
  - `user`: A map representing the user.

  ## Examples

      iex> user = %{name: "Alice"}
      iex> Abbreviations.update_usr_info(user)
      %{name: "Alice", updated_at: ~U[2023-01-01T00:00:00Z]}
  """
  def update_usr_info(user) do
    user
    |> Map.put(:updated_at, DateTime.utc_now())
  end
end
