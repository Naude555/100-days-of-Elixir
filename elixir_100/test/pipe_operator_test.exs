defmodule PipeOperatorTest do
  use ExUnit.Case
  alias PipeOperator

  test "transform_string_pipe/1 converts to uppercase and reverses" do
    assert PipeOperator.transform_string_pipe("hello") == "OLLEH"
  end

  test "transform_string_no_pipe/1 converts to uppercase and reverses" do
    assert PipeOperator.transform_string_no_pipe("hello") == "OLLEH"
  end

  test "sum_and_double_pipe/1 sums and doubles" do
    assert PipeOperator.sum_and_double_pipe([1, 2, 3]) == 12
  end

  test "sum_and_double_no_pipe/1 sums and doubles" do
    assert PipeOperator.sum_and_double_no_pipe([1, 2, 3]) == 12
  end

  test "filter_and_square_pipe/1 filters even numbers and squares them" do
    assert PipeOperator.filter_and_square_pipe([1, 2, 3, 4]) == [4, 16]
  end

  test "filter_and_square_no_pipe/1 filters even numbers and squares them" do
    assert PipeOperator.filter_and_square_no_pipe([1, 2, 3, 4]) == [4, 16]
  end

  test "first_word_pipe/1 extracts the first word" do
    assert PipeOperator.first_word_pipe("hello world") == "hello"
  end

  test "first_word_no_pipe/1 extracts the first word" do
    assert PipeOperator.first_word_no_pipe("hello world") == "hello"
  end
end
