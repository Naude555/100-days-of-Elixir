defmodule Logic do
  @moduledoc """
  Use comments to clarify the purpose and steps of complex algorithms or business logic.
  Adding explanatory comments to complex code sections helps others understand the implementation and reasoning behind it.

  """

  # Good Code
  @doc """
    **Why is this good?**
    - **Clarity**: Each step of the function is explained with comments, making it easy to understand the purpose of the code.
    - **Maintainability**: Future developers (or yourself) can quickly understand the logic without needing to decipher the code.
    - **Error Prevention**: The comment about ensuring the discount is between 0 and 1 highlights a critical validation step.
  """
  def calculate_discounted_price(price, discount) do
    # Ensure the discount is between 0 and 1
    if discount < 0 or discount > 1 do
      raise ArgumentError, "Discount must be between 0 and 1"
    end

    # Calculate the discount amount
    discount_amount = price * discount

    # Subtract the discount amount from the original price
    final_price = price - discount_amount

    # Return the final price
    final_price
  end

# Bad Code

@doc """
  **Why is this bad?**
  - **Lack of Clarity**: The code does not explain the purpose of the discount calculation, making it harder to understand.
  - **No Validation**: There is no check for the discount value, which could lead to incorrect calculations or runtime errors.
  - **Redundant Comments**: The comments do not add value and could be considered noise.
"""
def bad_calculate_discounted_price(price, discount) do   if discount < 0 or discount > 1 do
    raise ArgumentError, "Discount must be between 0 and 1"
  end
  # Calculate discount amount
  discount_amount = price * discount
  # Calculate final price
  final_price = price - discount_amount
  final_price
end

end
