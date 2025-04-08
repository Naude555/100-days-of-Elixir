defmodule GenserverProcess do
  @moduledoc """
  Demonstrates the use of GenServer behavior to create and manage stateful processes in a concurrent environment.

  ### Explanation of GenServer and Its Benefits

  In Elixir, a **GenServer** is a generic server implementation provided by the OTP (Open Telecom Platform) framework. It abstracts the complexities of managing state, handling concurrency, and message passing, making it easier to build robust and maintainable stateful processes.

  A **GenServer** works by defining two main parts:
  1. **Client API**: Functions that interact with the GenServer (e.g., `start_link/1`, `increment/1`, `get_count/0`).
  2. **Server Callbacks**: Functions that handle the actual logic and state management (e.g., `init/1`, `handle_cast/2`, `handle_call/3`).

  ### Why GenServer is Preferred
  - **Separation of Concerns**: Client API is separate from server logic, making the code easier to read and maintain.
  - **Concurrency**: GenServer handles concurrency internally, avoiding race conditions.
  - **Fault Tolerance**: GenServers work with OTP supervisors to restart processes if they crash.
  - **Standardized Behavior**: Provides a consistent and well-documented way to build stateful processes.
  """

  defmodule Counter do
    use GenServer

    # Client API
    @doc """
    Starts the GenServer process with an initial value.
    """
    def start_link(initial_value) do
      GenServer.start_link(__MODULE__, initial_value, name: __MODULE__)
    end

    @doc """
    Increments the counter by the given amount (default is 1).
    """
    def increment(amount \\ 1) do
      GenServer.cast(__MODULE__, {:increment, amount})
    end

    @doc """
    Retrieves the current count.
    """
    def get_count do
      GenServer.call(__MODULE__, :get_count)
    end

    # Server Callbacks
    @impl true
    def init(initial_value) do
      {:ok, initial_value}
    end

    @impl true
    def handle_cast({:increment, amount}, state) do
      {:noreply, state + amount}
    end

    @impl true
    def handle_call(:get_count, _from, state) do
      {:reply, state, state}
    end
  end

  # Usage Example
  {:ok, _pid} = Counter.start_link(0)
  Counter.increment(5)
  IO.puts(Counter.get_count()) # Output: 5


  defmodule BadCounter do
  @doc """
  ### Why Raw Processes Are Less Ideal

  The `BadCounter` module demonstrates the use of raw processes and message passing, which introduces several issues:
  - **Manual Message Passing**: Error-prone and harder to debug.
  - **No Fault Tolerance**: No built-in mechanism to restart the process if it crashes.
  - **Concurrency Issues**: Race conditions can occur without safeguards.
  - **Tight Coupling**: Client and server logic are tightly coupled, making the code harder to maintain.
  - **Blocking Behavior**: Blocking calls can lead to performance bottlenecks.
  """
    def start do
      spawn(fn -> loop(0) end)
    end

    defp loop(count) do
      receive do
        {:increment, amount} ->
          loop(count + amount)

        {:get_count, pid} ->
          send(pid, count)
          loop(count)
      end
    end

    def increment(pid, amount \\ 1) do
      send(pid, {:increment, amount})
    end

    def get_count(pid) do
      send(pid, {:get_count, self()})
      receive do
        count -> count
      end
    end
  end

  # Usage Example
  pid = BadCounter.start()
  BadCounter.increment(pid, 5)
  IO.puts(BadCounter.get_count(pid))
end
