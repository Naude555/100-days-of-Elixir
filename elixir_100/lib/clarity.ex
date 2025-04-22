defmodule Clarity do
  @moduledoc """
  Use complete sentences in comments to enhance understanding and communication.
  Writing clear and descriptive comments ensures that the purpose and functionality
  of the code are easily understood by others. This is particularly important in
  collaborative projects or when maintaining code over time.
  """

  # Good Example
  @doc """
  Convert temperature from Fahrenheit to Celsius using the standard formula.
  This function takes a temperature in Fahrenheit as input and returns the
  equivalent temperature in Celsius.
  """
  @spec farenheight_to_celcius(float()) :: float()
  def farenheight_to_celcius(farenheight) do
    (farenheight - 32) * 5 / 9
  end

  # Bad Example
  @doc """
  Convert Fahrenheit to Celsius.
  """
  @spec bad_farenheight_to_celcius(float()) :: float()
  def bad_farenheight_to_celcius(farenheight) do
    (farenheight - 32) * 5 / 9
  end

  # Additional Example
  @doc """
  Calculate the area of a rectangle given its width and height.
  This function takes two arguments: the width and height of the rectangle.
  It returns the calculated area as a float.
  """
  @spec rectangle_area(float(), float()) :: float()
  def rectangle_area(width, height) do
    width * height
  end
end
