defmodule Sigils do
  @moduledoc """
  Sigils are a powerful feature in Elixir that allow you to create custom syntax for manipulating data.
  They can be used to define custom string interpolation, regular expressions, and other data structures in a concise and readable manner.
  This module provides an overview of sigils, including their syntax, usage, and best practices.

  ## Why Sigils Are Important

  1. **Improved Readability**:
     Sigils provide a clear and concise way to represent data structures like strings, regular expressions, and charlists.
     For example, using `~r` for regular expressions or `~s` for strings makes the intent of the code immediately obvious to the reader.

  2. **Reduced Escaping Complexity**:
     When working with strings that contain special characters, quotes, or escape sequences, sigils reduce the need for escaping.
     For instance, `~s(Hello, "World!")` avoids the need to escape the quotes, making the code cleaner and easier to understand.

  3. **Customizability**:
     Elixir allows developers to define their own custom sigils, enabling domain-specific syntax for specialized use cases.
     This can be particularly useful in libraries or applications that require unique data representations.

  4. **Consistency**:
     Sigils provide a standardized way to handle common patterns like regular expressions, strings, and charlists.
     This consistency helps maintain uniformity across the codebase, making it easier to read and maintain.

  5. **Enhanced Functionality**:
     Sigils often come with built-in features that simplify common tasks. For example, the `~r` sigil for regular expressions supports options like case-insensitivity (`i`) or multiline mode (`m`), which can be appended directly to the sigil (e.g., `~r/hello/i`).

  """


  ##Good Examples of Sigil Usage

  ### Regular Expressions
  regex = ~r/\d{3}-\d{2}-\d{4}/
  # Matches patterns like "123-45-6789".

  ### Strings
  string = ~s(Hello, "World!")
  # Avoids escaping quotes, making the code cleaner.


  ### Charlists
  charlist = ~c(Hello, World!)
  # Creates a charlist, which is a list of character codes.



  ### Interpolation and Escaping
  name = "Peter"
  interpolated_string = ~s(This is #{name})
  escaped_string = ~S(This is a literal \n newline)
  # The `~S` sigil prevents interpolation and escaping, treating the content as a literal string.


  # Bad Code

  # Creating a regular expressing without sigils
  regex = Regex.compile!("hello")

  # Creating a string without sigils
  name = "John Doe"

  # Creating a charlist without sigils
  charlist = 'hello'

  # Handeling different types of strings without sigils
  interpolated_string = "This is "<> name
  escaped_string = "This is a literal \\n newline"

end
