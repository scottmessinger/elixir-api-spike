defmodule CommonStandardsProject.JurisdictionController do
  use CommonStandardsProject.Web, :controller

  alias CommonStandardsProject.Jurisdiction

  plug :scrub_params, "jurisdiction" when action in [:create, :update]

  def index(conn, _params) do
    jurisdictions = Repo.all(Jurisdiction)
    render(conn, "index.json", jurisdictions: jurisdictions)
  end

  def create(conn, %{"jurisdiction" => jurisdiction_params}) do
    changeset = Jurisdiction.changeset(%Jurisdiction{}, jurisdiction_params)

    if changeset.valid? do
      jurisdiction = Repo.insert!(changeset)
      render(conn, "show.json", jurisdiction: jurisdiction)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(CommonStandardsProject.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    jurisdiction = Repo.get!(Jurisdiction, id)
    render conn, "show.json", jurisdiction: jurisdiction
  end

  def update(conn, %{"id" => id, "jurisdiction" => jurisdiction_params}) do
    jurisdiction = Repo.get!(Jurisdiction, id)
    changeset = Jurisdiction.changeset(jurisdiction, jurisdiction_params)

    if changeset.valid? do
      jurisdiction = Repo.update!(changeset)
      render(conn, "show.json", jurisdiction: jurisdiction)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(CommonStandardsProject.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    jurisdiction = Repo.get!(Jurisdiction, id)

    jurisdiction = Repo.delete!(jurisdiction)
    render(conn, "show.json", jurisdiction: jurisdiction)
  end
end
