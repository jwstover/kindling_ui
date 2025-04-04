defmodule KindlingUI.Components.List do
  @moduledoc false

  use KindlingUI, :html

  @doc """
  Renders a data list.

  ## Examples

      <.list>
        <:item title="Title"><%= @post.title %></:item>
        <:item title="Views"><%= @post.views %></:item>
      </.list>
  """
  slot :item, required: true do
    attr :title, :string, required: true
  end

  def list(assigns) do
    ~H"""
    <div>
      <dl class="-my-4 divide-y divide-base-content/20">
        <div :for={item <- @item} class="flex gap-4 py-4 text-sm leading-6 sm:gap-8">
          <dt class="w-1/4 flex-none text-base-content">{item.title}</dt>
          <dd class="text-base-content/80">{render_slot(item)}</dd>
        </div>
      </dl>
    </div>
    """
  end
end
