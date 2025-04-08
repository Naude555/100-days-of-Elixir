defmodule LeveragingMacros do
  @moduledoc """
  The `LeveragingMacros` module demonstrates the use of macros in Elixir to enhance code readability and maintainability.
  Macros allow developers to define reusable code patterns that can be expanded at compile time, making the code more expressive and reducing boilerplate.

  ## Purpose
  - Showcase the power of macros in Elixir for code generation and abstraction.
  - Provide examples of how macros can simplify repetitive tasks and improve code clarity.

  ## Key Concepts
  - `defmacro`: Defines a macro to generate code at compile time.
  - `quote`: Specifies the code to be generated within a macro.
  - `unquote`: Injects values into quoted code.
  - `@doc`: Adds documentation for macros, similar to functions.

  ## Usage
  - To use a macro, `require` the module that defines it.
  - Macros are invoked like functions but are expanded at compile time.
  - Use macros to generate repetitive code patterns, reducing boilerplate and improving readability.

  ### When to Avoid Macros
  - **Complexity**: Overusing macros can make code harder to understand and debug.
  - **Maintainability**: Macros can obscure the actual code being executed.
  - **Alternatives**: Prefer functions or modules when possible for simplicity.

  ### Summary
  - **Good Examples**: Use macros for generating reusable or repetitive code patterns at compile time.
  - **Bad Examples**: Avoid macros for tasks better suited to regular functions.
  - **Best Practices**: Use macros sparingly and document them well to ensure maintainability.

  ## Conclusion
  - Macros are a powerful feature of Elixir that can enhance code readability and maintainability.
  - By leveraging macros, developers can create expressive and reusable code patterns that simplify complex tasks.
  - Use macros judiciously to avoid introducing unnecessary complexity.

  ## References
  - [Elixir Macros Documentation](https://hexdocs.pm/elixir/Macro.html)
  """

  @doc """
  Generates a `factorial/1` function at compile time.

  #### Why is this a "Good Example"?
  1. **Code Reusability**: The macro can be reused in multiple modules.
  2. **Compile-Time Optimization**: Functions are generated during compilation, reducing runtime overhead.
  3. **Readability**: Abstracts away repetitive patterns of defining recursive functions.
  """
  defmacro generate_factorial do
    quote do
      def factorial(0), do: 1
      def factorial(n) when n > 0 do
        n * factorial(n - 1)
      end
    end
  end

  @doc """
  Generates a `fibonacci/1` function at compile time.

  #### Why is this a "Good Example"?
  - Similar benefits as `generate_factorial`, including reusability, optimization, and readability.
  """
  defmacro generate_fibonacci do
    quote do
      def fibonacci(0), do: 0
      def fibonacci(1), do: 1
      def fibonacci(n) when n > 1 do
        fibonacci(n - 1) + fibonacci(n - 2)
      end
    end
  end

  @doc """
  A "bad example" of defining `factorial/1` as a regular function.

  #### Why is this a "Bad Example"?
  1. **Repetition**: Requires rewriting similar functions in other modules.
  2. **Runtime Overhead**: Logic is interpreted at runtime.
  3. **Error-Prone**: Repeated code increases the risk of bugs.
  """
  def factorial(n) do
    case n do
      0 -> 1
      _ when n > 0 -> n * factorial(n - 1)
      _ -> {:error, "Invalid input"}
    end
  end

  @doc """
  A "bad example" of defining `fibonacci/1` as a regular function.

  #### Why is this a "Bad Example"?
  - Same issues as the `factorial/1` function: repetition, runtime overhead, and error-prone code.
  """
  def fibonacci(n) do
    case n do
      0 -> 0
      1 -> 1
      _ when n > 1 -> fibonacci(n - 1) + fibonacci(n - 2)
      _ -> {:error, "Invalid input"}
    end
  end

  @doc """
  Wraps a function with logging behavior.

  #### Example
  ```elixir
  require LeveragingMacros
  LeveragingMacros.log_execution(:my_function)
  ```
  """
  defmacro log_execution(fun_name) do
    quote do
      def unquote(fun_name)(args) do
        IO.puts("Executing #{unquote(fun_name)} with args: #{inspect(args)}")
      end
    end
  end

  @doc """
  Generates boilerplate CRUD operations for a given entity.

  #### Example
  ```elixir
  require LeveragingMacros
  LeveragingMacros.generate_crud(:user)
  ```
  """
  defmacro generate_crud(entity) do
    quote do
      def create(attrs), do: {:ok, Map.put(%{}, unquote(entity), attrs)}
      def read(id), do: {:ok, %{id: id, name: "Sample"}}
      def update(id, attrs), do: {:ok, Map.merge(%{id: id}, attrs)}
      def delete(id), do: {:ok, "Deleted #{id}"}
    end
  end
end
