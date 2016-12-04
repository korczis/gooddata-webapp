defmodule Webapp.Request do
  require Logger

  @host Application.get_env(:webapp, Webapp.Endpoint)[:gooddata][:host]

  @headers [
    {"Content-Type", "application/json"},
    {"Accept", "application/json"}
  ]

  @options Application.get_env(:webapp, Webapp.Endpoint)[:httpoison]

  def get(url, cookies \\ nil) do
    Logger.info "GET #{url}"

    remote_url = "https://#{@host}#{url}"
    HTTPoison.get!(remote_url, get_headers(cookies), @options)
  end

  def post(url, payload, cookies \\ nil) do
    Logger.info "POST #{url}"

    remote_url = "https://#{@host}#{url}"
    HTTPoison.post!(remote_url, Poison.encode!(payload), get_headers(cookies), @options)
  end

  defp get_headers(cookies) do
    case cookies do
      nil -> @headers
      [] -> @headers
      _ -> @headers ++ [{"cookie", Enum.join(cookies, "; ")}]
    end
  end
end
