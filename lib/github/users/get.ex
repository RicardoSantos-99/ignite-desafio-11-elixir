defmodule Github.Users.Get do
  use Tesla

  @request_headers [{"user-agent", "Tesla"}]

  plug Tesla.Middleware.Headers, @request_headers
  plug Tesla.Middleware.BaseUrl, "https://api.github.com"
  plug Tesla.Middleware.JSON

  def user_repos(login) do
    get("/users/" <> login <> "/repos")
  end
end
