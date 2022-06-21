defmodule GithubWeb.UsersView do
  use GithubWeb, :view

  def render("users.json", %{users: users}) do
    %{data: render_many(users, __MODULE__, "user.json")}
  end

  def render("user.json", %{users: users}) do
    IO.inspect(users)

    %{
      "id" => users.id,
      "name" => users.name,
      "description" => users.description,
      "html_url" => users.html_url,
      "stargazers_count" => users.stargazers_count
    }
  end
end
