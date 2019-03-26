defmodule TokenGeneratorTest do
  use ExUnit.Case
  doctest TokenGenerator

  test "greets the world" do
    assert TokenGenerator.hello() == :world
  end
end
