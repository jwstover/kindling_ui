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

  attr :href, :string,
    default: nil,
    doc: "A URL passed to the href attribute on the menu item anchor tag"

  attr :icon, :any, default: nil, doc: "A heroicon to be place at before the menu item label"
  attr :icon_class, :any, default: "", doc: "Custom classes to place on the icon element"
  attr :label, :string, default: nil, doc: "The label for the menu item"
  attr :on_click, :any, default: nil, doc: "Passed to phx-click. Handles menu item press."

  slot :icon_block, required: false
  slot :inner_block, required: false

  def menu_item(assigns) do
    ~H"""
    <li>
      <a href={@href} phx-click={@on_click}>
        <.icon :if={@icon} name={@icon} class={["h-5 w-5", @icon_class]} />
        <%= render_slot(@icon_block) %>
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

  slot :label_block, required: false
  slot :inner_block, required: false

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
