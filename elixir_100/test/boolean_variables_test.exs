defmodule BooleanVariablesTest do
  use ExUnit.Case
  alias BooleanVariables

  describe "BooleanVariables functions" do
    test "is_active?/1 returns the correct value" do
      struct = %BooleanVariables{active: true}
      assert BooleanVariables.is_active?(struct) == true

      struct = %BooleanVariables{active: false}
      assert BooleanVariables.is_active?(struct) == false
    end

    test "is_visible?/1 returns the correct value" do
      struct = %BooleanVariables{visible: true}
      assert BooleanVariables.is_visible?(struct) == true

      struct = %BooleanVariables{visible: false}
      assert BooleanVariables.is_visible?(struct) == false
    end

    test "is_enabled?/1 returns the correct value" do
      struct = %BooleanVariables{enabled: true}
      assert BooleanVariables.is_enabled?(struct) == true

      struct = %BooleanVariables{enabled: false}
      assert BooleanVariables.is_enabled?(struct) == false
    end

    test "is_valid?/1 returns the correct value" do
      struct = %BooleanVariables{valid: true}
      assert BooleanVariables.is_valid?(struct) == true

      struct = %BooleanVariables{valid: false}
      assert BooleanVariables.is_valid?(struct) == false
    end

    test "has_permission?/1 returns the correct value" do
      struct = %BooleanVariables{permission: true}
      assert BooleanVariables.has_permission?(struct) == true

      struct = %BooleanVariables{permission: false}
      assert BooleanVariables.has_permission?(struct) == false
    end
  end
end
