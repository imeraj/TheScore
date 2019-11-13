defmodule TheScore.Rushings do
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
end
