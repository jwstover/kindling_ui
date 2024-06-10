defmodule KindlingUI.Components do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      import KindlingUI.Components.Button
      import KindlingUI.Components.Header
    end
  end
end
