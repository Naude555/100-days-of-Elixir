defmodule AbbreviationsTest do
  use ExUnit.Case
  alias Abbreviations

  describe "fetch_user_by_index/1" do
    test "returns the user at the given index" do
      assert Abbreviations.fetch_user_by_index(0) == "Alice"
      assert Abbreviations.fetch_user_by_index(1) == "Bob"
      assert Abbreviations.fetch_user_by_index(2) == "Charlie"
      assert Abbreviations.fetch_user_by_index(-1) == "Charlie"
    end

    test "returns nil for an out-of-bounds index" do
      assert Abbreviations.fetch_user_by_index(3) == nil
    end
  end

  describe "update_usr_information/1" do
    test "adds an updated_at timestamp to the user map" do
      user = %{name: "Alice"}
      updated_user = Abbreviations.update_user_information(user)

      assert Map.has_key?(updated_user, :updated_at)
      assert updated_user.name == "Alice"
      assert is_struct(updated_user.updated_at, DateTime)
    end
  end

  describe "fetch_usr_by_idx/1" do
    test "returns the user at the given index" do
      assert Abbreviations.fetch_usr_by_idx(0) == "Alice"
      assert Abbreviations.fetch_usr_by_idx(1) == "Bob"
      assert Abbreviations.fetch_usr_by_idx(2) == "Charlie"
      assert Abbreviations.fetch_usr_by_idx(-1) == "Charlie"
    end

    test "returns nil for an out-of-bounds index" do
      assert Abbreviations.fetch_usr_by_idx(3) == nil
    end
  end

  describe "update_usr_info/1" do
    test "adds an updated_at timestamp to the user map" do
      user = %{name: "Alice"}
      updated_user = Abbreviations.update_usr_info(user)

      assert Map.has_key?(updated_user, :updated_at)
      assert updated_user.name == "Alice"
      assert is_struct(updated_user.updated_at, DateTime)
    end
  end
end
