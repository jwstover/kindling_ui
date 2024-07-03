defmodule KindlingUI.Components.Navbar do
  @moduledoc false

  use KindlingUI, :html

  attr :class, :any, default: ""

  slot :inner_block

  slot :nav_start do
    attr :class, :any
  end

  slot :nav_center do
    attr :class, :any
  end

  slot :nav_end do
    attr :class, :any
  end

  def navbar(assigns) do
    ~H"""
    <div class={["navbar justify-between", @class]}>
      <div
        :for={nav_start <- @nav_start}
        class={["inline-flex justify-start items-center gap-2", Map.get(nav_start, :class)]}
      >
        <%= render_slot(nav_start) %>
      </div>
      <div
        :for={nav_center <- @nav_center}
        class={["inline-flex grow justify-center items-center gap-2", Map.get(nav_center, :class)]}
      >
        <%= render_slot(nav_center) %>
      </div>
      <div
        :for={nav_end <- @nav_end}
        class={["inline-flex justify-end items-center gap-2", Map.get(nav_end, :class)]}
      >
        <%= render_slot(nav_end) %>
      </div>
    </div>
    """
  end
end
