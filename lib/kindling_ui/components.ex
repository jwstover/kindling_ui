defmodule KindlingUI.Components do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      import KindlingUI.Commands
      import KindlingUI.Components.Avatar
      import KindlingUI.Components.Button
      import KindlingUI.Components.CodeBlock
      import KindlingUI.Components.Drawer
      import KindlingUI.Components.Flash
      import KindlingUI.Components.Header
      import KindlingUI.Components.Icon
      import KindlingUI.Components.Input
      import KindlingUI.Components.Label
      import KindlingUI.Components.List
      import KindlingUI.Components.Menu
      import KindlingUI.Components.Modal
      import KindlingUI.Components.Navbar
      import KindlingUI.Components.SimpleForm
      import KindlingUI.Components.Table
    end
  end
end
