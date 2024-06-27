defmodule KindlingUI.Gettext do
  @moduledoc false

  use Gettext, otp_app: Application.compile_env(:kindling_ui, :otp_app)
end
