defmodule Documentation do

  ## Utilize built-in documentation features to provide clear and accessible information about modules and functions.
  ##   ## Good Example
  ##  ### Why is this a "Good Example"?
  ##   - **Clarity**: The documentation is clear and concise, making it easy to understand the purpose of the module and its functions.
  ##   - **Structure**: The use of sections, parameters, and return values provides a structured overview of the functionality.
  ##   - **Examples**: Including examples demonstrates how to use the functions effectively.
  ##   - **Consistency**: The documentation follows a consistent format, making it easier for developers to read and understand.
  ##   - **Best Practices**: The documentation adheres to Elixir's conventions for writing module and function documentation.
  ##   - **Accessibility**: The use of `@moduledoc` and `@doc` attributes ensures that the documentation is accessible through the Elixir documentation system.
  ##   - **Maintainability**: The documentation is easy to maintain and update as the code evolves.
  ##   - **Comprehensiveness**: The documentation covers all aspects of the module and its functions, providing a complete overview.
  ##   - **User-Focused**: The documentation is written with the end-user in mind, providing clear instructions and examples.
  ##   - **Error Handling**: The documentation includes information about error handling and edge cases, helping developers understand potential pitfalls.
  ##   - **Versioning**: The documentation can be versioned alongside the code, ensuring that it remains relevant and accurate.
  ##   - **Searchability**: The use of keywords and tags makes the documentation searchable, allowing developers to find relevant information quickly.
  ##   - **Integration**: The documentation can be integrated with tools like ExDoc to generate HTML documentation, making it easy to share with others.
  ##   - **Collaboration**: The documentation encourages collaboration by providing clear guidelines for using the module and its functions.


  defmodule Good.Application do
    @moduledoc """
    This module provides functionality for managing user accounts.

    It includes features such as creating new user accounts, authenticating users,
    and updating user profiles. Each function is documented with its purpose,
    parameters, and return values to ensure clarity and ease of use.
    """

    @doc """
    Creates a new user account.

    ## Parameters
      - `username` (String): The desired username for the new account.
      - `email` (String): The email address associated with the account.
      - `password` (String): The password for the new account.

    ## Returns
      - `{:ok, user}`: If the user was created successfully.
      - `{:error, reason}`: If the creation failed.

    ## Examples

        iex> Good.Application.create_user("john_doe", "john@example.com", "securepassword")
        {:ok, %User{username: "john_doe", email: "john@example.com"}}

        iex> Good.Application.create_user("", "invalid_email", "short")
        {:error, :invalid_data}
    """
    def create_user(username, email, password) do
      cond do
        username == "" or email == "" or password == "" ->
          {:error, :invalid_data}

        String.length(password) < 6 ->
          {:error, :password_too_short}

        not String.contains?(email, "@") ->
          {:error, :invalid_email}

        true ->
          user = %{
            username: username,
            email: email,
            password: :crypto.hash(:sha256, password) |> Base.encode16()
          }
          {:ok, user}
      end
    end
  end

  defmodule Bad.Application do
    ## Manages a users
    #Creates a user
    def create_user(username, email, password) do
      cond do
        username == "" or email == "" or password == "" ->
          {:error, :invalid_data}

        String.length(password) < 6 ->
          {:error, :password_too_short}

        not String.contains?(email, "@") ->
          {:error, :invalid_email}

        true ->
          user = %{
            username: username,
            email: email,
            password: :crypto.hash(:sha256, password) |> Base.encode16()
          }
          {:ok, user}
      end
    end
  end

  ## No tests added as this is about documentation not code functionality
end
