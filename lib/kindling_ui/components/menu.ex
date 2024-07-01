defmodule KindlingUI.Components.Menu do
  @moduledoc false

  use KindlingUI, :html

  import KindlingUI.Components.Icon

  attr :class, :string, default: ""
  attr :horizontal, :boolean, default: false

  slot :inner_block

  def menu(assigns) do
    ~H"""
    <ul class={["menu", @class, @horizontal && "menu-horizontal"]}>
      <%= render_slot(@inner_block) %>
    </ul>
    """
  end

  attr :icon, :any, default: nil, doc: "A heroicon to be place at before the menu item label"
  attr :icon_class, :any, default: "", doc: "Custom classes to place on the icon element"
  attr :label, :string, default: nil, doc: "The label for the menu item"
  attr :on_click, :any, default: nil, doc: "Passed to phx-click. Handles menu item press."

  slot :inner_block, default: nil

  def menu_item(assigns) do
    ~H"""
    <li>
      <a phx-click={@on_click}>
        <.icon :if={@icon} name={@icon} class={["h-5 w-5", @icon_class]} />
        <span :if={@label}><%= @label %></span>
        <%= render_slot(@inner_block) %>
      </a>
    </li>
    """
  end

  attr :icon, :string, default: nil
  attr :icon_class, :any, default: "", doc: "Classes to be applied to the icon element"
  attr :label, :string, default: nil
  attr :open, :boolean, default: false

  slot :label_block, default: nil
  slot :inner_block, default: nil

  def submenu(assigns) do
    ~H"""
    <li>
      <details open={@open}>
        <summary>
          <.icon :if={@icon} name={@icon} class={["h-5 w-5", @icon_class]} />
          <span :if={@label}><%= @label %></span>
          <%= render_slot(@label_block) %>
        </summary>
        <ul>
          <%= render_slot(@inner_block) %>
        </ul>
      </details>
    </li>
    """
  end
end
