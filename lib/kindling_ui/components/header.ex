defmodule KindlingUI.Components.Header do
  @moduledoc false

  use KindlingUI, :html

  @doc """
  Renders a header with title.
  """
  attr :class, :string, default: nil
  attr :level, :integer, default: 1

  slot :inner_block, required: true
  slot :subtitle
  slot :actions

  def header(assigns) do
    font_size =
      case assigns.level do
        1 -> "text-2xl"
        2 -> "text-xl"
        3 -> "text-lg"
        4 -> "text-base"
      end

    assigns = assign(assigns, :font_size, font_size)

    ~H"""
    <header class={[@actions != [] && "flex items-center justify-between gap-6", @class]}>
      <div>
        <h1 class={[@font_size, "font-semibold leading-8 text-base-content"]}>
          <%= render_slot(@inner_block) %>
        </h1>
        <p :if={@subtitle != []} class="mt-2 text-sm leading-6 text-base-content/80">
          <%= render_slot(@subtitle) %>
        </p>
      </div>
      <div class="flex-none"><%= render_slot(@actions) %></div>
    </header>
    """
  end
end
