defmodule KindlingUI.Components.Drawer do
  @moduledoc false

  use KindlingUI, :html

  import KindlingUI.Utils

  attr :id, :string
  attr :class, :string, default: nil

  slot :inner_block
  slot :side do
    attr :class, :string
  end

  def drawer(assigns) do
    assigns =
      assigns
      |> assign_new(:id, fn -> random_id("drawer") end)

    ~H"""
    <div class={["drawer", @class]}>
      <input id={@id} type="checkbox" class="drawer-toggle" />
      <div class="drawer-content">
        <%= render_slot(@inner_block) %>
      </div>
      <aside :for={side <- @side} class={["drawer-side absolute h-full", Map.get(side, :class)]}>
        <label for={@id} aria-label="close sidebar" class="drawer-overlay"></label>
        <%= render_slot(@side) %>
      </aside>
    </div>
    """
  end

  attr :class, :string, default: ""
  attr :drawer_id, :string, required: true

  slot :inner_block

  def drawer_trigger(assigns) do
    ~H"""
    <label for={@drawer_id} class={["btn drawer-button", @class]}>
      <%= render_slot(@inner_block) %>
    </label>
    """
  end
end
