defmodule KindlingUI.Components.Loading do
  @moduledoc false

  use KindlingUI, :html

  attr :class, :any, default: nil

  def loading(assigns) do
    ~H"""
    <span class={["loading", @class]} />
    """
  end
end
