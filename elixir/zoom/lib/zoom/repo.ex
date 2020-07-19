defmodule Zoom.Repo do
  use Ecto.Repo,
    otp_app: :zoom,
    adapter: Ecto.Adapters.Postgres
end
