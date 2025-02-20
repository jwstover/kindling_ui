defmodule KindlingUI.Components.Footer do
  @moduledoc false

  use KindlingUI, :html

  attr :class, :any, default: nil, doc: "Additional classes to be applied to the footer element"

  slot :aside

  def footer(assigns) do
    ~H"""
    <footer class={["footer", @class]}>
      <aside :for={aside <- @aside}>
        {render_slot(aside)}
      </aside>

      {render_slot(@inner_block)}
    </footer>
    """
  end

  attr :title, :string, default: nil, doc: "Nav menu title"

  slot :nav_item do
    attr :title, :string, required: true
    attr :on_click, :any
  end

  def nav(assigns) do
    ~H"""
    <nav>
      <h6 :if={@title} class="footer-title">{@title}</h6>
      <a :for={nav_item <- @nav_item} class="link link-hover" phx-click={Map.get(nav_item, :on_click)}>
        {Map.get(nav_item, :title)}
      </a>
    </nav>
    """
  end
end
