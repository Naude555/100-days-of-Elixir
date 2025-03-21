defmodule PatternMatchingTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "basic_example outputs correct values" do
    output = capture_io(fn -> PatternMatching.basic_example() end)
    assert output == "a: 1, b: 2, c: 3\n"
  end

  test "describe handles {:ok, value}" do
    output = capture_io(fn -> PatternMatching.describe({:ok, "success"}) end)
    assert output == "The value is success\n"
  end

  test "describe handles {:error, reason}" do
    output = capture_io(fn -> PatternMatching.describe({:error, "failure"}) end)
    assert output == "An error occurred: failure\n"
  end

  test "list_example outputs head and tail" do
    output = capture_io(fn -> PatternMatching.list_example([1, 2, 3]) end)
    assert output == "Head: 1, Tail: [2, 3]\n"
  end

  test "list_example2 outputs correct values" do
    output = capture_io(fn -> PatternMatching.list_example2() end)
    assert output == "a: 1, b: 2, c: 3\n"
  end

  test "get_name outputs the name from a map" do
    output = capture_io(fn -> PatternMatching.get_name(%{name: "Alice"}) end)
    assert output == "Name: Alice\n"
  end

  test "tuple_example outputs correct values" do
    output = capture_io(fn -> PatternMatching.tuple_example() end)
    assert output == "a: 1, b: 2, c: 3\n"
  end

  test "better_describe handles {:ok, value}" do
    output = capture_io(fn -> PatternMatching.better_describe({:ok, "success"}) end)
    assert output == "The value is success\n"
  end

  test "better_describe handles {:error, reason}" do
    output = capture_io(fn -> PatternMatching.better_describe({:error, "failure"}) end)
    assert output == "An error occurred: failure\n"
  end

  test "better_describe handles invalid tuple" do
    output = capture_io(fn -> PatternMatching.better_describe(:invalid) end)
    assert output == "Invalid tuple\n"
  end
end
