defmodule ProtocolsPolymorphic do
  # Define a protocol for a generic to_string function
  defprotocol Stringify do
    @doc "Converts a data type to a string"
    def to_string(data)
  end

  # Implement the protocol for integers
  defimpl Stringify, for: Integer do
    def to_string(data), do: Integer.to_string(data)
  end

  # Implement the protocol for lists
  defimpl Stringify, for: List do
    def to_string(data), do: Enum.join(data, ", ")
  end

  # Implement the protocol for tuples
  defimpl Stringify, for: Tuple do
    def to_string(data), do: data |> Tuple.to_list() |> Enum.join(", ")
  end

  # Implement the protocol for maps
  defimpl Stringify, for: Map do
    def to_string(data), do: data |> Enum.sort() |> Enum.map(fn {k, v} -> "#{k}: #{v}" end) |> Enum.join(", ")
  end

  # Implement the protocol for atoms
  defimpl Stringify, for: Atom do
    def to_string(data), do: Atom.to_string(data)
  end

  # Define a protocol for summing data
  defprotocol Summable do
    @doc "Calculates the sum of a data type"
    def sum(data)
  end

  # Implement the protocol for lists
  defimpl Summable, for: List do
    def sum(data), do: Enum.sum(data)
  end

  # Implement the protocol for tuples
  defimpl Summable, for: Tuple do
    def sum(data), do: data |> Tuple.to_list() |> Enum.sum()
  end

  # Implement the protocol for maps (sum of values)
  defimpl Summable, for: Map do
    def sum(data), do: data |> Map.values() |> Enum.sum()
  end

  # Implement the protocol for integers (identity function)
  defimpl Summable, for: Integer do
    def sum(data), do: data
  end
end
