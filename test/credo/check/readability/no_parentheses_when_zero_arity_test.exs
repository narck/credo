defmodule Credo.Check.Readability.NoParenthesesWhenZeroArityTest do
  use Credo.TestHelper

  @described_check Credo.Check.Readability.NoParenthesesWhenZeroArity

  #
  # cases NOT raising issues
  #

  test "it should NOT report expected code" do
"""
defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    parameter1 + parameter2
  end

  def some_other_function do
    18
  end
end
""" |> to_source_file
    |> refute_issues(@described_check)
  end

  #
  # cases raising issues
  #

  test "it should report a violation" do
"""
defmodule Mix.Tasks.Credo do
  def run() do
    21
  end
end
""" |> to_source_file
    |> assert_issue(@described_check)
  end
end
