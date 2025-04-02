defmodule CalculateTest do
  use ExUnit.Case
  doctest Calculate

  test "calculate_sum/2 adds two numbers correctly" do
    assert Calculate.calculate_sum(3, 5) == 8
    assert Calculate.calculate_sum(-2, 4) == 2
    assert Calculate.calculate_sum(0, 0) == 0
  end

  test "calculate_difference/2 subtracts the second number from the first correctly" do
    assert Calculate.calculate_difference(10, 5) == 5
    assert Calculate.calculate_difference(0, 7) == -7
    assert Calculate.calculate_difference(3, 3) == 0
  end

  test "compute_sum/2 adds two numbers correctly (less clear alternative)" do
    assert Calculate.compute_sum(3, 5) == 8
    assert Calculate.compute_sum(-2, 4) == 2
    assert Calculate.compute_sum(0, 0) == 0
  end

  test "compute_difference/2 subtracts the second number from the first correctly (less clear alternative)" do
    assert Calculate.compute_difference(10, 5) == 5
    assert Calculate.compute_difference(0, 7) == -7
    assert Calculate.compute_difference(3, 3) == 0
  end
end
