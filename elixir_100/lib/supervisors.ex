defmodule Supervisors do
  @moduledoc """
  Supervisors are essential in Elixir for creating fault-tolerant applications by monitoring and restarting child processes.
  They are specialized processes designed to manage other processes, known as child processes, and ensure system resilience by restarting them when necessary.

  Supervisors are part of the OTP (Open Telecom Platform) framework, which provides design principles and libraries for building concurrent and fault-tolerant applications in Elixir.

  ### Key Concepts
  - **Supervisor**: A process that monitors and manages child processes.
  - **Child Process**: A process supervised by a supervisor. It can be a `GenServer`, `Task`, or any other process.
  - **Restart Strategy**: Defines how a supervisor should handle a child process that terminates. Common strategies include:
    - `:one_for_one`: Only the crashed child process is restarted.
    - `:one_for_all`: All child processes are restarted if one crashes.
    - `:rest_for_one`: The crashed process and all processes started after it are restarted.
  - **Supervision Tree**: A hierarchical structure of supervisors and their child processes. The root of the tree is typically a top-level supervisor.

  ### Benefits of Using Supervisors
  - **Fault Tolerance**: Supervisors automatically restart child processes that crash, ensuring the system remains operational.
  - **Isolation**: Each child process is isolated, so if one fails, it does not affect others.
  - **Dynamic Supervision**: Supervisors can dynamically add or remove child processes at runtime.
  - **Structured Approach**: Supervisors provide a structured way to manage processes, making the codebase easier to understand and maintain.

  ### When to Use Supervisors
  - When building concurrent applications that require fault tolerance.
  - When you need to manage multiple processes that can fail independently.
  - When you want to ensure that your application can recover from failures without manual intervention.
  ### Best Practices
  - Always use supervisors to manage processes in Elixir applications.
  - Choose the appropriate restart strategy based on the application's requirements.
  - Keep the supervision tree shallow to avoid complexity.
  - Use `Supervisor.Spec` to define child specifications for better readability and maintainability.
  - Monitor the health of child processes and implement custom restart strategies if necessary.
  - Use `Supervisor.terminate_child/2` to gracefully stop child processes when needed.
  - Use `Supervisor.restart_child/2` to restart a child process if it has been terminated.
  - Use `Supervisor.which_children/1` to get a list of all child processes and their statuses.
  - Use `Supervisor.count_children/1` to get the count of child processes and their statuses.
  - Use `Supervisor.stop/2` to stop the supervisor and all its child processes.
  - Use `Supervisor.terminate/2` to terminate the supervisor and all its child processes.
  - Use `Supervisor.restart/2` to restart the supervisor and all its child processes.
  - Use `Supervisor.start_child/2` to start a new child process under the supervisor.
  - Use `Supervisor.stop_child/2` to stop a child process under the supervisor.

  """

  #### Good Example
  ## The following example demonstrates a proper use of a supervisor with a `:one_for_one` strategy. If a child process crashes, only that process is restarted.


  defmodule Good.Application do
    use Application

    @impl true
    def start(_type, _args) do
      children = [
        # Define workers and child supervisors to be supervised
        {Good.Worker, :some_arg},
        {Good.AnotherWorker, :another_arg}
      ]

      # Use a rest_for_one strategy, which means if a child process terminates,
      # it and all processes started after it are restarted.
      opts = [strategy: :rest_for_one, name: Good.Supervisor]
      Supervisor.start_link(children, opts)
    end
  end

  defmodule Good.Worker do
    use GenServer

    # Starts the GenServer
    def start_link(arg) do
      GenServer.start_link(__MODULE__, arg, name: __MODULE__)
    end

    # Callbacks
    @impl true
    def init(arg) do
      {:ok, arg}
    end

    @impl true
    def handle_call(:get_state, _from, state) do
      {:reply, state, state}
    end

    @impl true
    def handle_call(_msg, _from, state) do
      {:reply, {:error, :unknown_message}, state}
    end

    @impl true
    def handle_call(_msg, _from, _state) do
      {:reply, {:error, :unknown_message}, :unknown_state}
    end
  end

  defmodule Good.AnotherWorker do
    use GenServer

    # Starts the GenServer
    def start_link(arg) do
      GenServer.start_link(__MODULE__, arg, name: __MODULE__)
    end

    # Callbacks
    @impl true
    def init(arg) do
      {:ok, arg}
    end

    @impl true
    def handle_call(:get_state, _from, state) do
      {:reply, state, state}
    end
  end


  #### Bad Example
  ##In this example, the worker is started directly without supervision. If the worker crashes, there is no mechanism to restart it, leading to potential application failure.


  defmodule Bad.Application do
    use Application

    @impl true
    def start(_type, _args) do
      # Directly starting the worker without supervision
      Bad.Worker.start_link(:some_arg)
    end
  end

  defmodule Bad.Worker do
    use GenServer

    # Starts the GenServer
    def start_link(arg) do
      GenServer.start_link(__MODULE__, arg, name: __MODULE__)
    end

    # Callbacks
    @impl true
    def init(arg) do
      {:ok, arg}
    end

    @impl true
    def handle_call(:get_state, _from, state) do
      {:reply, state, state}
    end
    @impl true
    def handle_call(_msg, _from, state) do
      {:reply, {:error, :unknown_message}, state}
    end

    @impl true
    def handle_call(_msg, _from, _state) do
      {:reply, {:error, :unknown_message}, :unknown_state}
    end
  end


  ### Summary
  ##Always use supervisors to manage processes in Elixir. They provide fault tolerance, isolation, and a structured approach to building resilient applications. Avoid starting processes directly without supervision, as it can lead to unhandled crashes and system instability.

end
