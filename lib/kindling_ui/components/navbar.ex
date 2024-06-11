defmodule KindlingUI.Components.Navbar do
  @moduledoc false

  use KindlingUI, :html

  attr :class, :string, default: ""

  slot :inner_block

  def navbar(assigns) do
    ~H"""
    <navbar class={["navbar", @class]}>
      <%= render_slot(@inner_block) %>
    </navbar>
    """
  end

  attr :class, :string, default: ""

  slot :inner_block

  def navbar_start(assigns) do
    ~H"""
    <div class={["navbar-start", @class]}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :class, :string, default: ""

  slot :inner_block

  def navbar_center(assigns) do
    ~H"""
    <div class={["navbar-center", @class]}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :class, :string, default: ""

  slot :inner_block

  def navbar_end(assigns) do
    ~H"""
    <div class={["navbar-end", @class]}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
