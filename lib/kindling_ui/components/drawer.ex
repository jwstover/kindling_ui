defmodule KindlingUI.Components.Drawer do
  @moduledoc false

  use KindlingUI, :html

  import KindlingUI.Utils

  attr :id, :string
  attr :class, :string, default: nil

  slot :inner_block
  slot :side

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
      <div class="drawer-side absolute h-full">
        <label for={@id} aria-label="close sidebar" class="drawer-overlay"></label>
        <%= render_slot(@side) %>
      </div>
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
