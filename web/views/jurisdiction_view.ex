defmodule CommonStandardsProject.JurisdictionView do
  use CommonStandardsProject.Web, :view

  def render("index.json", %{jurisdictions: jurisdictions}) do
    %{data: render_many(jurisdictions, "jurisdiction.json")}
  end

  def render("show.json", %{jurisdiction: jurisdiction}) do
    %{data: render_one(jurisdiction, "jurisdiction.json")}
  end

  def render("jurisdiction.json", %{jurisdiction: jurisdiction}) do
    %{id: jurisdiction.id}
  end
end
