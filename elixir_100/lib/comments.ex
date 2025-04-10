defmodule Comments do
  @moduledoc """
  Explain the reasoning behind code decisions to enhance understanding and maintainability.
  The following code demonstrates the difference between commenting on 'why' versus 'what' or 'how'.
  """

  # Good comments
  # Explain the reasoning or context behind the code.

  # We use a timeout of 5 seconds to prevent indefinite waiting
  # in case of network issues or unresponsive services.
  def fetch_user_data(user_id) do
    case HTTPoison.get("https://api.example.com/users/#{user_id}", [], timeout: 5000) do
      {:ok, %{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body)}

      {:error, %{reason: reason}} ->
        {:error, "Failed to fetch user data: #{reason}"}
    end
  end

  # Using a binary search here because the list is sorted and binary search is O(log n).
  def find_element(sorted_list, target) do
    binary_search(sorted_list, target)
  end

  # Using a custom JSON parser because the default library does not support nested structures.
  def parse_custom_json(json_string) do
    CustomJSONParser.parse(json_string)
  end

  # Bad comments
  # These comments state the obvious or describe 'what' the code does, which is redundant.

  # Get user data
  # Make HTTP request
  # Parse JSON response
  def fetch_user_data_bad(user_id) do
    case HTTPoison.get("https://api.example.com/users/#{user_id}", [], timeout: 5000) do
      {:ok, %{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body)}

      {:error, %{reason: reason}} ->
        {:error, "Failed to fetch user data: #{reason}"}
    end
  end

  # Search for the target in the list.
  def find_element_bad(sorted_list, target) do
    binary_search(sorted_list, target)
  end

  # Parse the JSON string.
  def parse_custom_json_bad(json_string) do
    CustomJSONParser.parse(json_string)
  end

  ## Not tests added as this is about comments on code not code functionality
end
