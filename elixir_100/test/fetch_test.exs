defmodule FetchTest do
  use ExUnit.Case
  doctest Fetch

  test "fetch_user_by_index/1 returns the user at the given index" do
    assert Fetch.fetch_user_by_index(0) == {:ok, "Alice"}
    assert Fetch.fetch_user_by_index(1) == {:ok, "Bob"}
    assert Fetch.fetch_user_by_index(2) == {:ok, "Charlie"}
    assert Fetch.fetch_user_by_index(-1) == {:ok, "Charlie"}
    assert Fetch.fetch_user_by_index(11) == {:error, "Index out of bounds"}
  end

  test "get_user_by_index/1 returns the user at the given index" do
    assert Fetch.get_user_by_index(0) == "Alice"
    assert Fetch.get_user_by_index(1) == "Bob"
    assert Fetch.get_user_by_index(2) == "Charlie"
    assert Fetch.get_user_by_index(-1) == "Charlie"
    assert Fetch.get_user_by_index(11) == nil
  end
end
