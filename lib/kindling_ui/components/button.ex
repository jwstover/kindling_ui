defmodule KindlingUI.Components.Button do
  @moduledoc false

  use KindlingUI, :html

  import KindlingUI.Components.Icon

  attr :class, :string, default: nil
  attr :icon, :string, default: nil
  attr :icon_end, :string, default: nil
  attr :type, :string, default: nil
  attr :rest, :global, include: ~w(disabled form name value)

  slot :inner_block, required: true

  def button(assigns) do
    ~H"""
    <button type={@type} class="btn-container" {@rest}>
      <div class={["btn", @class]}>
        <.icon :if={@icon} name={@icon} class="btn-icon" />
        <%= render_slot(@inner_block) %>
        <.icon :if={@icon_end} name={@icon_end} class="btn-icon" />
      </div>
    </button>
    """
  end
end
