defmodule GenserverProcessTest do
  use ExUnit.Case
  alias GenserverProcess.Counter
  alias GenserverProcess.BadCounter

  describe "Counter (GenServer-based)" do
    setup do
      {:ok, _pid} = Counter.start_link(0)
      :ok
    end

    test "increments the counter by a given amount" do
      Counter.increment(5)
      assert Counter.get_count() == 5
    end

    test "increments the counter by the default amount (1)" do
      Counter.increment()
      assert Counter.get_count() == 1
    end

    test "retrieves the current count" do
      Counter.increment(3)
      assert Counter.get_count() == 3
    end
  end

  describe "BadCounter (raw process-based)" do
    setup do
      pid = BadCounter.start()
      {:ok, pid: pid}
    end

    test "increments the counter by a given amount", %{pid: pid} do
      BadCounter.increment(pid, 5)
      assert BadCounter.get_count(pid) == 5
    end

    test "increments the counter by the default amount (1)", %{pid: pid} do
      BadCounter.increment(pid)
      assert BadCounter.get_count(pid) == 1
    end

    test "retrieves the current count", %{pid: pid} do
      BadCounter.increment(pid, 3)
      assert BadCounter.get_count(pid) == 3
    end
  end
end
