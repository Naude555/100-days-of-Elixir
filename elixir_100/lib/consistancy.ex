defmodule Consistancy do
  @moduledoc """
  This module highlights the importance of maintaining consistent terminology
  throughout both comments and code. Consistency enhances readability, reduces
  ambiguity, and ensures that the codebase is easier to understand and maintain.
  When terminology in comments aligns with the actual code, developers can
  quickly comprehend the intent and functionality without unnecessary guesswork.

  In the good example, the term "server" is used consistently in both the comments
  and the code, providing clarity and reinforcing the purpose of the implementation.
  In contrast, the bad example uses inconsistent terminology ("Launch" and "Boot up"),
  which can lead to confusion and misinterpretation of the code's intent.
  """

  # Good Code
  # Start the server process
  defmodule Server do
    def start_server() do
    # Initializes the server
    :ok
    end
  end

  # Bad Code
  # Launch the server process
  defmodule BadServer do
    def start_server() do
    # Boot up the server
    :ok
    end
  end
end
