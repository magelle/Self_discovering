defmodule SelfDiscoveringTest do
  use ExUnit.Case
  doctest SelfDiscovering

  test "greets the world" do
    assert SelfDiscovering.hello() == :world
  end
end
