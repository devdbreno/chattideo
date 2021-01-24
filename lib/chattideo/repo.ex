defmodule Chattideo.Repo do
  use Ecto.Repo,
    otp_app: :chattideo,
    adapter: Ecto.Adapters.Postgres
end
