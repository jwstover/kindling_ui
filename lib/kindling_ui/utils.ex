defmodule KindlingUI.Utils do
  @moduledoc false

  def random_id(prefix) do
    s = for _ <- 1..10, into: "", do: <<Enum.random(~c"0123456789abcdef")>>

    prefix <> "-" <> s
  end
end
