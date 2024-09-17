defmodule KindlingUI.Gettext do
  @moduledoc false

  use Gettext.Backend, otp_app: Application.compile_env(:kindling_ui, :otp_app)
end
