defmodule Elixir100Test do
  use ExUnit.Case
  doctest Elixir100

  test "greets the world" do
    assert Elixir100.hello() == :world
  end
end
