defmodule GuardClausesTest do
  use ExUnit.Case
  alias GuardClauses

  describe "square/1" do
    test "returns the square of an integer" do
      assert GuardClauses.square(4) == 16
      assert GuardClauses.square(-3) == 9
    end

    test "returns an error for non-integer input" do
      assert GuardClauses.square("4") == {:error, "Input must be an integer"}
      assert GuardClauses.square(4.5) == {:error, "Input must be an integer"}
    end
  end

  describe "check_number/1" do
    test "returns 'Positive' for positive numbers" do
      assert GuardClauses.check_number(5) == "Positive"
    end

    test "returns 'Negative' for negative numbers" do
      assert GuardClauses.check_number(-3) == "Negative"
    end

    test "returns 'Zero' for zero" do
      assert GuardClauses.check_number(0) == "Zero"
    end
  end

  describe "age_category/1" do
    test "returns 'Child' for ages less than 13" do
      assert GuardClauses.age_category(10) == "Child"
    end

    test "returns 'Teen' for ages between 13 and 17" do
      assert GuardClauses.age_category(16) == "Teen"
    end

    test "returns 'Adult' for ages 18 and older" do
      assert GuardClauses.age_category(25) == "Adult"
    end
  end

  describe "temperature_feeling/1" do
    test "returns 'Freezing' for temperatures below 0" do
      assert GuardClauses.temperature_feeling(-5) == "Freezing"
    end

    test "returns 'Cold' for temperatures between 0 and 15" do
      assert GuardClauses.temperature_feeling(10) == "Cold"
    end

    test "returns 'Warm' for temperatures between 15 and 25" do
      assert GuardClauses.temperature_feeling(20) == "Warm"
    end

    test "returns 'Hot' for temperatures 25 and above" do
      assert GuardClauses.temperature_feeling(30) == "Hot"
    end
  end
end
