defmodule CommonStandardsProject.Repo.Migrations.CreateJurisdiction do
  use Ecto.Migration

  def change do
    create table(:jurisdictions) do
      add :title, :string

      timestamps
    end

  end
end
