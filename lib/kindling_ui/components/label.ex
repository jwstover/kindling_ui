defmodule KindlingUI.Components.Label do
  @moduledoc false

  use KindlingUI, :html

  @doc """
  Renders a label
  """

  attr :for, :string, default: nil

  slot :inner_block, required: true

  def label(assigns) do
    ~H"""
    <label for={@for} class="label">
      <span class="label-text"><%= render_slot(@inner_block) %></span>
    </label>
    """
  end
end
