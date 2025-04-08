defmodule TestSupervisors do
  use ExUnit.Case, async: true

  alias Supervisors.Good.Worker
  alias Supervisors.Good.AnotherWorker

  describe "Good.Worker" do
    test "starts and responds to :get_state" do
      {:ok, pid} = Worker.start_link(:some_state)
      assert GenServer.call(pid, :get_state) == :some_state
    end

    test "handles unknown messages" do
      {:ok, pid} = Worker.start_link(:some_state)
      assert GenServer.call(pid, :unknown_message) == {:error, :unknown_message}
    end
  end

  describe "Good.AnotherWorker" do
    test "starts and responds to :get_state" do
      {:ok, pid} = AnotherWorker.start_link(:another_state)
      assert GenServer.call(pid, :get_state) == :another_state
    end
  end

  describe "Bad.Worker" do
    test "starts and responds to :get_state" do
      {:ok, pid} = Supervisors.Bad.Worker.start_link(:bad_state)
      assert GenServer.call(pid, :get_state) == :bad_state
    end

    test "handles unknown messages" do
      {:ok, pid} = Supervisors.Bad.Worker.start_link(:bad_state)
      assert GenServer.call(pid, :unknown_message) == {:error, :unknown_message}
    end
  end

  describe "Good.Application supervision" do
    test "supervises workers and restarts them on crash" do
      {:ok, _supervisor_pid} = Supervisors.Good.Application.start(:normal, [])

      # Fetch the child processes
      children = Supervisor.which_children(Supervisors.Good.Supervisor)
      assert length(children) == 2

      # Find the Good.Worker process
      [{_, worker_pid, _, _}] = Enum.filter(children, fn {id, _, _, _} -> id == Worker end)
      assert Process.alive?(worker_pid)

      # Simulate a crash
      Process.exit(worker_pid, :kill)
      :timer.sleep(100)

      # Ensure the worker is restarted
      children_after_crash = Supervisor.which_children(Supervisors.Good.Supervisor)
      [{_, new_worker_pid, _, _}] = Enum.filter(children_after_crash, fn {id, _, _, _} -> id == Worker end)
      assert Process.alive?(new_worker_pid)
    end
  end
end
