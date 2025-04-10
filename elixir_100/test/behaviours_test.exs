defmodule BehavioursTest do
  use ExUnit.Case

  alias Behaviours.MyApp.{GoodWorker, BadWorker, WorkerBehaviour}

  describe "MyApp.GoodWorker" do
    test "implements the WorkerBehaviour callbacks" do
      assert GoodWorker.__info__(:attributes)[:behaviour] == [WorkerBehaviour]
    end



    test "do_work/1 performs work and returns :ok" do
      assert GoodWorker.do_work(:some_work) == :ok
    end

  end

  describe "MyApp.BadWorker" do
    test "does not declare a behaviour" do
      assert BadWorker.__info__(:attributes)[:behaviour] == nil
    end


    test "do_work/1 performs work and returns :ok" do
      assert BadWorker.do_work(:some_work) == :ok
    end

  end
end
