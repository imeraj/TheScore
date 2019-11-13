defmodule TheScore.Rushings do
  import Ecto.Query

  alias TheScore.Rushing
  alias TheScore.Repo

  @doc false
  def create_rushing(attrs \\ %{}) do
    %Rushing{}
    |> Rushing.changeset(attrs)
    |> Repo.insert()
  end

  @doc false
  def list_rushings(params) do
    Rushing
    |> Repo.paginate(params)
  end

  @doc false
  def filter_rushings(filter) do
    Rushing
    |> where(name: ^filter)
    |> Repo.paginate(nil)
  end
end
