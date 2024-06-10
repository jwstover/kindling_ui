defmodule KindlingUiTest do
  use ExUnit.Case
  doctest KindlingUi

  test "greets the world" do
    assert KindlingUi.hello() == :world
  end
end
