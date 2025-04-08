defmodule ModuleAttributesTest do
  use ExUnit.Case
  alias ModuleAttributes.{AppConfig, GoodExample, BadExample}

  describe "AppConfig module" do
    test "max_user_limit returns the correct value" do
      assert AppConfig.max_user_limit() == 100
    end

    test "default_role returns the correct value" do
      assert AppConfig.default_role() == :guest
    end
  end

  describe "GoodExample module" do
    test "create_user returns an error when user limit is exceeded" do
      attrs = Enum.into(1..101, %{}, fn i -> {"key#{i}", i} end)
      assert GoodExample.create_user(attrs) == {:error, "User limit exceeded"}
    end

    test "create_user assigns default role when within user limit" do
      attrs = %{"name" => "John"}
      assert GoodExample.create_user(attrs) == {:ok, %{"name" => "John", :role => :guest}}
    end
  end

  describe "BadExample module" do
    test "create_user returns an error when user limit is exceeded" do
      attrs = Enum.into(1..101, %{}, fn i -> {"key#{i}", i} end)
      assert BadExample.create_user(attrs) == {:error, "User limit exceeded"}
    end

    test "create_user assigns default role when within user limit" do
      attrs = %{"name" => "John"}
      assert BadExample.create_user(attrs) == {:ok, %{"name" => "John", :role => :guest}}
    end
  end
end
