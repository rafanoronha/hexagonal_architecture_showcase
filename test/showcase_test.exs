defmodule ShowcaseTest do
  use ExUnit.Case
  doctest Showcase

  test "greets the world" do
    assert Showcase.hello() == :world
  end
end
