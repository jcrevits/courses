defmodule Zoom.Presence do
  use Phoenix.Presence,
    otp_app: :zoom,
    pubsub_server: Zoom.PubSub
end
