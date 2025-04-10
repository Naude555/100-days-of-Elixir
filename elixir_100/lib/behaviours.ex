defmodule Behaviours do
  @moduledoc """
  Behaviours in Elixir are used to define a set of functions that a module must implement, providing a way to enforce a common interface.
  Behaviours in Elixir allow you to define a set of function signatures that other modules must implement.
  This is particularly useful for creating a consistent interface across different modules, ensuring that they adhere to a specific contract.

  ### Good Code Using Behaviours (`MyApp.GoodWorker`)

  The `MyApp.GoodWorker` module is a good example of how to use behaviours in Elixir. Here's why:

  1. **Implements a Behaviour**:
    - The module explicitly declares `@behaviour MyApp.WorkerBehaviour`, which means it adheres to the contract defined by the `MyApp.WorkerBehaviour` behaviour.
    - This ensures that the module implements all the required callback functions (`start_link/1` and `do_work/1`).

  2. **Compile-Time Guarantees**:
    - If the module fails to implement any of the required callbacks, the Elixir compiler will raise an error. This provides a safety net, ensuring that the module conforms to the expected interface.

  3. **Documentation and Consistency**:
    - The behaviour serves as a clear contract for developers, making it easier to understand what functions a module must implement.
    - This is particularly useful in larger projects where multiple modules may need to implement the same behaviour.

  4. **Separation of Concerns**:
    - The behaviour defines the "what" (the required functions), while the module implementing the behaviour defines the "how" (the actual implementation). This separation makes the codebase more modular and easier to maintain.

  ### Bad Code Not Using Behaviours (`MyApp.BadWorker`)

  The `MyApp.BadWorker` module does not use behaviours, which introduces several potential issues:

  1. **No Compile-Time Guarantees**:
    - Since the module does not declare a behaviour, there is no guarantee that it implements the required functions. If a function is missing or has an incorrect signature, this will only be discovered at runtime, potentially leading to bugs.

  2. **Lack of a Clear Contract**:
    - Without a behaviour, there is no formal definition of what functions the module should implement. This can lead to inconsistencies across modules that are supposed to provide similar functionality.

  3. **Harder to Maintain**:
    - In a larger codebase, it becomes difficult to ensure that all modules adhere to the same interface without a behaviour. This can lead to duplicated or inconsistent code.

  4. **Reduced Readability**:
    - Developers reading the code may not immediately understand the intended interface or contract for the module, making it harder to work with or extend.

  ### Summary

  Using behaviours, as demonstrated in `MyApp.GoodWorker`, provides a structured and consistent way to define and enforce a common interface across modules. This leads to more maintainable, reliable, and readable code. On the other hand, not using behaviours, as in `MyApp.BadWorker`, can result in a lack of guarantees, inconsistencies, and potential runtime errors. Behaviours are especially valuable in scenarios where multiple modules need to implement the same functionality, such as workers, adapters, or handlers.

  """

  # Good code using behaviours
  defmodule MyApp.WorkerBehaviour do
    @moduledoc """
    Defines the behaviour for a worker module.
    """

    @callback start_link(any()) :: {:ok, pid()} | {:error, any()}
    @callback do_work(any()) :: :ok | {:error, any()}
  end

  defmodule MyApp.GoodWorker do
    @moduledoc """
    Implements the `MyApp.WorkerBehaviour` using GenServer.
    """

    @behaviour MyApp.WorkerBehaviour

    @doc """
    Starts the GenServer process with the given argument.
    """
    def start_link(arg) do
      GenServer.start_link(__MODULE__, arg, name: via_tuple(arg))
    end

    @doc """
    Performs the work. Returns `:ok` on success or `{:error, reason}` on failure.
    """
    def do_work(_arg) do
      try do
        # Replace with actual work logic
        :ok
      rescue
        exception -> {:error, exception}
      end
    end

    # GenServer callbacks

    def init(arg) do
      {:ok, arg}
    end

    # Helper function for dynamic process naming
    defp via_tuple(arg) do
      {:via, Registry, {MyApp.Registry, arg}}
    end
  end

  # Bad Code not using behaviours
  defmodule MyApp.BadWorker do
    @doc """
    Starts the GenServer process with the given argument.
    """
    def start_link(arg) do
      GenServer.start_link(__MODULE__, arg, name: via_tuple(arg))
    end

    @doc """
    Performs the work. Returns `:ok` on success or `{:error, reason}` on failure.
    """
    def do_work(_arg) do
      try do
        # Replace with actual work logic
        :ok
      rescue
        exception -> {:error, exception}
      end
    end

    # GenServer callbacks

    def init(arg) do
      {:ok, arg}
    end

    # Helper function for dynamic process naming
    defp via_tuple(arg) do
      {:via, Registry, {MyApp.Registry, arg}}
    end
  end

end
