defmodule Streams do
  @moduledoc """
  Streams allow for lazy evaluation and composition on enumerable operations improving performance and code readability

  ### Why Streams Are Needed
  1. **Efficiency with Large Data**: When working with large collections (e.g., a range of 1 to 1,000,000), eagerly processing the entire dataset (as in the `bad_example`) can consume a lot of memory and CPU. Streams avoid this by processing elements one at a time, only as needed.

  2. **Modularity and Composability**: Streams allow you to chain multiple operations (like filtering, mapping, etc.) in a clean and modular way. Each operation is deferred until the result is explicitly required, making the code more efficient and easier to reason about.

  3. **Avoiding Intermediate Data Structures**: Without streams, each operation (e.g., `filter`, `map`) creates a new intermediate collection in memory. Streams avoid this overhead by processing elements on-the-fly.

  ---

  ### How Streams Work
  Streams are **lazy enumerables**. When you use functions like `Stream.filter` or `Stream.map`, they don't immediately execute. Instead, they return a **stream object** that represents the sequence of operations. The actual computation happens only when you "consume" the stream, such as with `Enum.take`, `Enum.to_list`, or similar functions.

  ### Key Takeaways
  - Use **streams** when working with large datasets or when you want to optimize memory and CPU usage.
  - Streams are **lazy**, meaning they only compute results when explicitly required.
  - They improve **performance** by avoiding intermediate collections and processing only the necessary elements.

  If you're working with small datasets or don't need lazy evaluation, using `Enum` functions (as in `bad_example`) is fine. But for scalability and efficiency, streams are the better choice.
  """

#### Good Example (Using Streams)

large_list = 1..1_000_000
result = large_list
|> Stream.filter(&(&1 > 500_000))  # Lazily filters numbers > 500,000
|> Stream.map(&(&1 * 2))           # Lazily doubles the filtered numbers
|> Enum.take(10)                   # Takes the first 10 results, triggering computation
IO.inspect(result)

# - **Lazy Evaluation**: The `filter` and `map` operations are deferred until `Enum.take` is called.
# - **Memory Efficiency**: Only the first 10 elements that satisfy the conditions are processed, not the entire range.
# - **Performance**: No intermediate collections are created.

#### Bad Example (Without Streams)

large_list = 1..1_000_000
result = large_list
|> Enum.filter(&(&1 > 500_000))  # Eagerly filters numbers > 500,000
|> Enum.map(&(&1 * 2))           # Eagerly doubles all filtered numbers
|> Enum.take(10)                 # Takes the first 10 results
IO.inspect(result)

# - **Eager Evaluation**: Each operation (`filter`, `map`) is executed immediately, creating intermediate collections.
# - **Memory Usage**: The entire filtered list (500,000 elements) and mapped list are stored in memory.
# - **Performance**: More CPU and memory are used due to intermediate data structures.
end
