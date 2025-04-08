defmodule ModuleAttributes do
  @moduledoc """
  Module attributes should be used for defining constants and configuration values to improve maintainability and readability.
  Elixir allows the use of module attributes to define constants and configuration values. This approach centralizes configuration and constants, making the code easier to manage and change.
  """

  defmodule AppConfig do
    @moduledoc """
    This module defines constants using module attributes.

    Module attributes like `@max_user_limit` and `@default_role` are used here to centralize configuration values.
    This makes the code easier to maintain because if these values need to change, you only need to update them in one place.
    """

    @max_user_limit 100
    @default_role :guest

    @doc """
    Returns the maximum user limit.
    """
    def max_user_limit do
      @max_user_limit
    end

    @doc """
    Returns the default role for a user.
    """
    def default_role do
      @default_role
    end
  end

  defmodule GoodExample do
    @moduledoc """
    This module demonstrates a good use of module attributes.

    By using the constants defined in `AppConfig`, this module avoids hardcoding values directly in the function.
    This improves readability and makes the code easier to update in the future.
    """

    @doc """
    Creates a user with the given attributes.

    If the number of attributes exceeds the maximum user limit defined in `AppConfig`,
    it returns an error. Otherwise, it assigns the default role to the user and returns the updated attributes.
    """
    def create_user(attrs) when is_map(attrs) do
      if map_size(attrs) > AppConfig.max_user_limit() do
        {:error, "User limit exceeded"}
      else
        {:ok, Map.put(attrs, :role, AppConfig.default_role())}
      end
    end
  end

  defmodule BadExample do
    @moduledoc """
    This module demonstrates a bad use of module attributes.

    In this example, the constants `user_limit` and `default_role` are hardcoded directly in the function.
    This approach is problematic because:
      - It reduces maintainability: If the values need to change, you must update them in every place they are used.
      - It reduces readability: The purpose of these values is not immediately clear.
      - It increases the risk of errors: Hardcoding values in multiple places can lead to inconsistencies.
    """

    @doc """
    Creates a user with the given attributes.

    This implementation hardcodes the user limit and default role, which is not recommended.
    """
    def create_user(attrs) when is_map(attrs) do
      user_limit = 100
      default_role = :guest

      if map_size(attrs) > user_limit do
        {:error, "User limit exceeded"}
      else
        {:ok, Map.put(attrs, :role, default_role)}
      end
    end
  end
end
