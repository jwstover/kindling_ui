defmodule KindlingUI.Components.Collapse do
  @moduledoc false

  use KindlingUI, :html

  attr :class, :string, default: nil, doc: "Additional classes to apply to the collapse element"
  attr :title, :string, required: true, doc: "The collapse title"

  attr :title_class, :string,
    default: nil,
    doc: "Additional classes to apply to the collapse-title element"

  slot :inner_block, required: true

  def collapse(assigns) do
    ~H"""
    <details class={["collapse", @class]}>
      <summary class={["collapse-title text-xl font-medium", @title_class]}>
        <%= @title %>
      </summary>
      <div class="collapse-content">
        <%= render_slot(@inner_block) %>
      </div>
    </details>
    """
  end
end
