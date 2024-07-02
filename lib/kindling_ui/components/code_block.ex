defmodule KindlingUI.Components.CodeBlock do
  @moduledoc false

  use KindlingUI, :html

  attr :class, :string, default: ""
  attr :line_numbers, :boolean, default: false
  attr :prefix, :string, default: "$"

  slot :code, doc: "A single line of code" do
    attr :highlight, :boolean, doc: "Highlight the current line"
    attr :class, :any, doc: "Additionall CSS classes to apply to the code line"
  end

  def code_block(assigns) do
    ~H"""
    <div class={["mockup-code", @class]}>
      <%= for {line, index} <- Enum.with_index(@code) do %>
        <pre
          data-prefix={(@line_numbers && index + 1) || @prefix}
          class={[
            Map.get(line, :highlight) && "bg-warning text-warning-content",
            Map.get(line, :class)
          ]}
        ><code><%= render_slot(line) %></code></pre>
      <% end %>
    </div>
    """
  end
end
