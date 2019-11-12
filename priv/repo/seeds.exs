# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TheScore.Repo.insert!(%TheScore.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule TheScoreWeb.DevelopmentSeeder do
  def insert_data do
    file()
    |> File.stream!()
    |> Jaxon.Stream.query([:root, :all])
    |> Enum.to_list()
    |> IO.inspect()
  end

  defp file() do
    Path.join(:code.priv_dir(:the_score), "data/rushing.json")
  end
end

case Mix.env() do
  :dev ->
    TheScoreWeb.DevelopmentSeeder.insert_data()

  _ ->
    :ignore
end
