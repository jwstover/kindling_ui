defmodule KindlingUI.Components.Avatar do
  @moduledoc false

  use KindlingUI, :html

  attr :class, :any, default: "", doc: "CSS classes to be applied to the avatar div"
  attr :online, :boolean, default: nil, doc: "Show online / offline indicator"
  attr :src, :string, doc: "URL of the avatar image to be displayed"
  attr :size, :any, default: "md", doc: "Size of avatar element (2xl, xl, lg, md, sm)"

  attr :placeholder, :string,
    default: nil,
    doc: "Placeholder text to be displayed instead of an image"

  def avatar(assigns) do
    {avatar_size, text_size} =
      case assigns.size do
        "xl" -> {"w-20", "text-3xl"}
        "lg" -> {"w-16", "text-xl"}
        "md" -> {"w-12", "text-base"}
        "sm" -> {"w-8", "text-xs"}
      end

    assigns = assign(assigns, %{avatar_size: avatar_size, text_size: text_size})

    ~H"""
    <div class={["avatar", @online == true && "online", @online == false && "offline"]}>
      <div :if={@src} class={[@avatar_size, @class]}>
        <img src={@src} />
      </div>
      <div :if={@placeholder} class={["bg-neutral text-neutral-content", @avatar_size, @class]}>
        <span class={[@text_size]}><%= @placeholder %></span>
      </div>
    </div>
    """
  end
end
