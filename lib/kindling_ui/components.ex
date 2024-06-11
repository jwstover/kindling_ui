defmodule KindlingUI.Components do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      import KindlingUI.Components.Button
      import KindlingUI.Components.CodeBlock
      import KindlingUI.Components.Drawer
      import KindlingUI.Components.Header
      import KindlingUI.Components.Icon
      import KindlingUI.Components.Menu
      import KindlingUI.Components.Navbar
    end
  end
end
