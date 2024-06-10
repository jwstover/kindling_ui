defmodule KindlingUI.Components.Button do
  @moduledoc false

  use KindlingUI, :html

  attr :type, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global, include: ~w(disabled form name value)

  slot :inner_block, required: true

  def button(assigns) do
    ~H"""
    <button type={@type} class={["btn", @class]} {@rest}>
      <%= render_slot(@inner_block) %>
    </button>
    """
  end
end
