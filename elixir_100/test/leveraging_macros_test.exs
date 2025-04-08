defmodule TestLeveragingMacros do
  use ExUnit.Case
  require LeveragingMacros

  # Test for generate_factorial macro
  defmodule FactorialTest do
    use ExUnit.Case
    require LeveragingMacros
    LeveragingMacros.generate_factorial()

    test "factorial of 0" do
      assert factorial(0) == 1
    end

    test "factorial of positive number" do
      assert factorial(5) == 120
    end
  end

  # Test for generate_fibonacci macro
  defmodule FibonacciTest do
    use ExUnit.Case
    require LeveragingMacros
    LeveragingMacros.generate_fibonacci()

    test "fibonacci of 0" do
      assert fibonacci(0) == 0
    end

    test "fibonacci of 1" do
      assert fibonacci(1) == 1
    end

    test "fibonacci of positive number" do
      assert fibonacci(6) == 8
    end
  end


  # Test for generate_crud macro
  defmodule CrudTest do
    use ExUnit.Case
    require LeveragingMacros
    LeveragingMacros.generate_crud(:user)

    test "create user" do
      assert create(%{name: "John"}) == {:ok, %{user: %{name: "John"}}}
    end

    test "read user" do
      assert read(1) == {:ok, %{id: 1, name: "Sample"}}
    end

    test "update user" do
      assert update(1, %{name: "Jane"}) == {:ok, %{id: 1, name: "Jane"}}
    end

    test "delete user" do
      assert delete(1) == {:ok, "Deleted 1"}
    end
  end
end
