defmodule GithubWeb.UserController do
  use GithubWeb, :controller

  def index(conn, %{"username" => username}) do
    {:ok, response} = Github.get_user_by_name(username)

    users =
      response.body
      |> Enum.map(fn elem ->
        %{
          name: elem["name"],
          id: elem["id"],
          description: elem["description"],
          html_url: elem["html_url"],
          stargazers_count: elem["stargazers_count"]
        }
      end)

    # |> Enum.chunk_every(2)
    # |> Enum.into(%{}, fn [a, b] -> {a, b} end)

    conn
    |> put_status(:ok)
    |> put_view(GithubWeb.UsersView)
    |> render("users.json", users: users)
  end
end
