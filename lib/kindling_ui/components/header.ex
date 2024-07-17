defmodule KindlingUI.Components.Header do
  @moduledoc false

  use KindlingUI, :html

  @doc """
  Renders a header with title.
  """
  attr :class, :string, default: nil

  slot :inner_block, required: true
  slot :subtitle
  slot :actions

  def header(assigns) do
    ~H"""
    <header class={[@actions != [] && "flex items-center justify-between gap-6", @class]}>
      <div>
        <.h1><%= render_slot(@inner_block) %></.h1>
        <p :if={@subtitle != []} class="mt-2 text-sm leading-6 text-base-content/80">
          <%= render_slot(@subtitle) %>
        </p>
      </div>
      <div class="flex-none"><%= render_slot(@actions) %></div>
    </header>
    """
  end

  attr :class, :any, default: nil
  slot :inner_block, required: true

  def h1(assigns) do
    ~H"""
    <h1 class={["text-2xl font-semibold leading-8 text-base-content", @class]}>
      <%= render_slot(@inner_block) %>
    </h1>
    """
  end

  attr :class, :any, default: nil
  slot :inner_block, required: true

  def h2(assigns) do
    ~H"""
    <h2 class={["text-xl font-semibold leading-8 text-base-content", @class]}>
      <%= render_slot(@inner_block) %>
    </h2>
    """
  end

  attr :class, :any, default: nil
  slot :inner_block, required: true

  def h3(assigns) do
    ~H"""
    <h3 class={["font-semibold leading-8 text-base-content", @class]}>
      <%= render_slot(@inner_block) %>
    </h3>
    """
  end
end
