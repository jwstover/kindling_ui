defmodule KindlingUI.Components.Modal do
  @moduledoc """
  Modal components.
  """

  use KindlingUI, :html

  import KindlingUI.Components.Button
  import KindlingUI.Components.Icon

  @doc """
  Renders a modal.

  ## Examples

      <.modal id="confirm-modal">
        This is a modal.
      </.modal>

  JS commands may be passed to the `:on_cancel` to configure
  the closing/cancel event, for example:

      <.modal id="confirm" on_cancel={JS.navigate(~p"/posts")}>
        This is another modal.
      </.modal>

  """
  attr :id, :string, required: true
  attr :show, :boolean, default: false
  attr :class, :any, default: ""
  attr :on_cancel, JS, default: %JS{}
  slot :inner_block, required: true

  def modal(assigns) do
    ~H"""
    <dialog
      id={@id}
      phx-mounted={@show && show_modal(@id)}
      phx-remove={hide_modal(@id)}
      data-cancel={JS.exec(@on_cancel, "phx-remove")}
      class={["modal", @class]}
    >
      <.focus_wrap
        id={"#{@id}-content"}
        phx-key="escape"
        phx-window-keydown={JS.exec("data-cancel", to: "##{@id}")}
        phx-click-away={JS.exec("data-cancel", to: "##{@id}")}
        class="modal-box relative top-20"
        tabindex="0"
      >
        <div class="absolute top-2 right-2">
          <.button
            class="btn-ghost btn-xs btn-square"
            phx-click={JS.exec("data-cancel", to: "##{@id}")}
          >
            <.icon name="hero-x-mark" />
          </.button>
        </div>
        {render_slot(@inner_block)}
      </.focus_wrap>
    </dialog>
    """
  end

  def show_modal(js \\ %JS{}, id) when is_binary(id) do
    js
    |> JS.add_class("modal-open", to: "##{id}")
    |> JS.focus_first(to: "##{id}-content")
  end

  def hide_modal(js \\ %JS{}, id) do
    js
    |> JS.remove_class("modal-open", to: "##{id}")
    |> JS.pop_focus()
  end
end
