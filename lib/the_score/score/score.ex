defmodule TheScore.Rushings do
  alias TheScore.Rushing
  alias TheScore.Repo

  @doc false
  def create_rushing(attrs \\ %{}) do
    %Rushing{}
    |> Rushing.changeset(attrs)
    |> Repo.insert()
  end
end
