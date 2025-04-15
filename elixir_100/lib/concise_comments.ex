defmodule ConciseComments do
  @moduledoc """
  Use concise comments to clarify the purpose of complex code or algorithms.
  Avoid redundant comments that state the obvious or describe 'what' the code does.
  Instead, focus on explaining the reasoning or context behind the code.
  This approach enhances code readability and maintainability, making it easier for others to understand the logic and intent behind the implementation.
  """

  # Good Code
  @doc """
  This function calculates the factorial of a number using recursion.
  It uses a helper function to handle the recursion and base case.
  """
  def factorial(n) when n < 0 do
    raise ArgumentError, "Negative numbers are not allowed"
  end

  def factorial(0), do: 1
  def factorial(n) do
    factorial_helper(n, 1)
  end
  defp factorial_helper(0, acc), do: acc
  defp factorial_helper(n, acc) when n > 0 do
    factorial_helper(n - 1, n * acc)
  end

  @doc """
  This function fetches user details from an external API.
  It uses HTTPoison to make the request and Jason to decode the JSON response.
  The timeout is set to 5 seconds to prevent indefinite waiting in case of network issues.
  """
  def fetch_user_details(user_id) do
    # Fetch user details from the API
    case HTTPoison.get("https://api.example.com/users/#{user_id}", [], timeout: 5000) do
      {:ok, %{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body)}
      {:error, %{reason: reason}} ->
        {:error, "Failed to fetch user details: #{reason}"}
    end
  end

  # Bad Code
  @doc """
  This function calculates the factorial of a number.
  It uses a helper function to handle the recursion and base case.
  The comments here are redundant and do not add value.
  The code is self-explanatory, and the comments do not provide any additional context or reasoning.
  The comments could be considered noise and should be removed to improve readability.
  """
  def factorial_bad(n) when n < 0 do
    raise ArgumentError, "Negative numbers are not allowed"
  end
  def factorial_bad(0), do: 1
  def factorial_bad(n) do
    # This is a recursive function to calculate the factorial.
    # It uses a helper function to handle the recursion and base case.
    factorial_helper(n, 1)
  end
  defp factorial_helper(0, acc), do: acc
  defp factorial_helper(n, acc) when n > 0 do
    # This is a recursive function to calculate the factorial.
    # It uses a helper function to handle the recursion and base case.
    factorial_helper(n - 1, n * acc)
  end

  @doc """
  This function fetches user details from an external API.
  It uses HTTPoison to make the request and Jason to decode the JSON response.
  The timeout is set to 5 seconds to prevent indefinite waiting in case of network issues.
  """
  def bad_fetch_user_details(user_id) do
    # Fetch user details from the API by the user id
    # It makes an http request to the external API
    # and decodes the JSON response using Jason.
    # if an error occurs, it returns an error message.
    # if the user is found it returns the user details.
    # The timeout is set to 5 seconds to prevent indefinite waiting in case of network issues.
    case HTTPoison.get("https://api.example.com/users/#{user_id}", [], timeout: 5000) do
      {:ok, %{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body)}
      {:error, %{reason: reason}} ->
        {:error, "Failed to fetch user details: #{reason}"}
    end
  end
end
