defmodule TheScoreWeb.ScoreController do
  use TheScoreWeb, :controller

  alias TheScore.Rushings

  def index(conn, _params) do
    data = Rushings.list_rushings()

    render(conn, "index.html", rushings: data)
  end

  def filter(conn, %{
        "filter" => %{"name" => name}
      }) do
    data = Rushings.filter_rushings(String.trim(name))

    render(conn, "index.html", rushings: data)
  end

  def sort(conn, %{"sort" => %{"sort_criteria" => criteria_id}}) do
    data = Rushings.sort_rushings(criteria_id)

    render(conn, "index.html", rushings: data)
  end
end
