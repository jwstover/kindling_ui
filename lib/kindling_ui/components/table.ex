defmodule KindlingUI.Components.Table do
  @moduledoc false

  use KindlingUI, :html

  @doc ~S"""
  Renders a table with generic styling.

  ## Examples

      <.table id="users" rows={@users}>
        <:col :let={user} label="id"><%= user.id %></:col>
        <:col :let={user} label="username"><%= user.username %></:col>
      </.table>
  """
  attr :id, :string, required: true
  attr :class, :any, default: ""
  attr :rows, :list, required: true
  attr :row_id, :any, default: nil, doc: "the function for generating the row id"
  attr :row_click, :any, default: nil, doc: "the function for handling phx-click on each row"
  attr :numbered, :boolean, default: false

  attr :row_item, :any,
    default: &Function.identity/1,
    doc: "the function for mapping each row before calling the :col and :action slots"

  slot :col, required: true do
    attr :label, :string
  end

  slot :action, doc: "the slot for showing user actions in the last table column"

  def table(assigns) do
    assigns =
      with %{rows: %Phoenix.LiveView.LiveStream{}} <- assigns do
        assign(assigns, row_id: assigns.row_id || fn {id, _item} -> id end)
      end

    ~H"""
    <table class={["table", @class]}>
      <thead>
        <tr>
          <th :if={@numbered}></th>
          <th :for={col <- @col}><%= col[:label] %></th>
          <th :if={@action != []}>
            <span class="sr-only"><%= gettext("Actions") %></span>
          </th>
        </tr>
      </thead>
      <tbody id={@id} phx-update={match?(%Phoenix.LiveView.LiveStream{}, @rows) && "stream"}>
        <tr
          :for={{row, n} <- Enum.with_index(@rows)}
          id={@row_id && @row_id.(row)}
          class={["hover", @row_click && "cursor-pointer"]}
        >
          <th :if={@numbered}><%= n + 1 %></th>
          <%= for {col, i} <- Enum.with_index(@col) do %>
            <th :if={i == 0 && !@numbered} phx-click={@row_click && @row_click.(row)}>
              <%= render_slot(col, @row_item.(row)) %>
            </th>
            <td :if={i != 0 || @numbered} phx-click={@row_click && @row_click.(row)}>
              <%= render_slot(col, @row_item.(row)) %>
            </td>
          <% end %>
          <td :if={@action != []}>
            <div class="flex flex-row flex-nowrap justify-center items-center gap-2">
              <span :for={action <- @action}>
                <%= render_slot(action, @row_item.(row)) %>
              </span>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
    """
  end
end
