defmodule KindlingUI.Components.Kbd do
  @moduledoc false

  use KindlingUI, :html

  attr :class, :string, default: nil
  slot :inner_block, required: true

  def kbd(assigns) do
    ~H"""
    <kbd class={["kbd", @class]}>{render_slot(@inner_block)}</kbd>
    """
  end
end
