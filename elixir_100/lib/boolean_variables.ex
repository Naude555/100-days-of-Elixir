defmodule BooleanVariables do
  @moduledoc """
  This module demonstrates the importance of using descriptive boolean variables in your code.

  ## Overview

  Boolean variables are a fundamental part of programming, but their effectiveness depends heavily on how they are named. This module provides examples of both bad and good naming practices for boolean variables, highlighting the impact of naming on code readability and maintainability.

  ## Sections

  ### Bad Naming Practices
  - **Ambiguous Names**: Variables like `flag` and `status` are vague and do not indicate the variable's purpose.
  - **Lack of Context**: Without descriptive names, developers may struggle to understand the variable's meaning.
  - **Inconsistent Naming**: Using different names for similar concepts can lead to confusion.

  ### Good Naming Practices
  - **Descriptive Names**: Variables like `is_active`, `is_visible`, and `is_enabled` clearly indicate the variable's purpose.
  - **Consistent Naming**: Using similar prefixes such as `is_` and `has_` for boolean variables makes the code more readable and maintainable.
  - **Self-Documenting Code**: Developers can quickly understand the variable's meaning without additional comments.

  ## Examples

  ### Bad Naming Practices
  The following functions demonstrate poor naming practices:
  - `active?/1`: Uses a vague variable name `flag`.
  - `visible?/1`: Uses a vague variable name `status`.
  - `enabled?/1`: Reuses the ambiguous name `flag`.
  - `valid?/1`: Reuses the ambiguous name `status`.
  - `permission?/1`: Reuses the ambiguous name `flag`.

  ### Good Naming Practices
  The following functions demonstrate good naming practices:
  - `is_active?/1`: Uses a descriptive variable name `is_active`.
  - `is_visible?/1`: Uses a descriptive variable name `is_visible`.
  - `is_enabled?/1`: Uses a descriptive variable name `is_enabled`.
  - `is_valid?/1`: Uses a descriptive variable name `is_valid`.
  - `has_permission?/1`: Uses a descriptive variable name `has_permission`.

  By adopting good naming practices, your code becomes more intuitive and easier to maintain, reducing the cognitive load for developers working on the codebase.
  """

  defstruct active: false, visible: true, enabled: true, valid: true, permission: false

  # Section: Bad Naming Practices
  @doc """
  ### Why It’s Bad:
  1. **Ambiguous Names**: Variables like `flag` and `status` are vague and do not indicate the variable's purpose.
  2. **Lack of Context**: Without descriptive names, developers may struggle to understand the variable's meaning.
  3. **Inconsistent Naming**: Using different names for similar concepts can lead to confusion.
  """
  def active?(%BooleanVariables{active: flag}) do
    flag
  end

  def visible?(%BooleanVariables{visible: status}) do
    status
  end

  def enabled?(%BooleanVariables{enabled: flag}) do
    flag
  end

  def valid?(%BooleanVariables{valid: status}) do
    status
  end

  def permission?(%BooleanVariables{permission: flag}) do
    flag
  end

  # Usage examples for good naming practices
  @doc """
  ### Why It’s Good:
  1. **Descriptive Names**: Variables like `is_active`, `is_visible`, and `is_enabled` clearly indicate the variable's purpose.
  2. **Consistent Naming**: Using similar prefixes `is_` and `has_` for boolean variables makes the code more readable and maintainable.
  3. **Self-Documenting Code**: Developers can quickly understand the variable's meaning without additional comments.
  """
  def is_active?(%BooleanVariables{active: is_active}) do
    is_active
  end

  def is_visible?(%BooleanVariables{visible: is_visible}) do
    is_visible
  end

  def is_enabled?(%BooleanVariables{enabled: is_enabled}) do
    is_enabled
  end

  def is_valid?(%BooleanVariables{valid: is_valid}) do
    is_valid
  end

  def has_permission?(%BooleanVariables{permission: has_permission}) do
    has_permission
  end

end
