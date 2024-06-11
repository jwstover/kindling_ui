defmodule KindlingUITest do
  use ExUnit.Case
  doctest KindlingUI

  test "greets the world" do
    assert KindlingUI.hello() == :world
  end
end
