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
      <div class={["btn flex flex-row flex-nowrap items-center", @class]}>
        <.icon :if={@icon} name={@icon} class="btn-icon" />
        <%= render_slot(@inner_block) %>
        <.icon :if={@icon_end} name={@icon_end} class="btn-icon" />
      </div>
    </button>
    """
  end

  @doc """
  Renders a back navigation link.

  ## Examples

      <.back navigate={~p"/posts"}>Back to posts</.back>
  """
  attr :navigate, :any, required: true
  attr :class, :any, default: nil

  slot :inner_block, required: true

  def back(assigns) do
    ~H"""
    <.link navigate={@navigate} class={["btn", @class]}>
      <.icon name="hero-arrow-left-solid" class="h-3 w-3" />
      <%= render_slot(@inner_block) %>
    </.link>
    """
  end
end
