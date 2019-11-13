defmodule TheScoreWeb.ScoreController do
  use TheScoreWeb, :controller

  alias TheScore.Rushings

  def index(conn, params) do
    page = Rushings.list_rushings(params)

    render(conn, "index.html",
      rushings: page.entries,
      page: page
    )
  end

  def filter(conn, %{
        "filter" => %{"name" => name}
      }) do
    page = Rushings.filter_rushings(String.trim(name))

    render(conn, "index.html",
      rushings: page.entries,
      page: page
    )
  end
end
