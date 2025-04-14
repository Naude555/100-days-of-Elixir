defmodule Performance do
  @moduledoc """
  Adding comments to explain non-obvious performance implications is crucial for maintaining and improving code quality.
  It helps others understand the reasoning behind specific optimizations and trade-offs, especially when the code prioritizes performance over readability.
  By documenting these decisions, you provide valuable context for future developers, enabling them to make informed choices and maintain consistency in similar scenarios.

  """
  # Good Code
  def compute_heavy_task(data) do
    # Using Enum.reduce instead of Enum.map to avoid creating an intermediate list,
    # which saves memory and improves performance.
    Enum.reduce(data, 0, fn x, acc -> acc + process(x) end) end

  # Bad Code
  def compute_heavy_task(data) do
    Enum.map(data, fn x -> process(x) end)
    |> Enum.sum()
  end

    ## No tests added as this is about comments on code not code functionality
end
