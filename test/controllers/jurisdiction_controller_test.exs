defmodule CommonStandardsProject.JurisdictionControllerTest do
  use CommonStandardsProject.ConnCase

  alias CommonStandardsProject.Jurisdiction
  @valid_attrs %{title: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, jurisdiction_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    jurisdiction = Repo.insert! %Jurisdiction{}
    conn = get conn, jurisdiction_path(conn, :show, jurisdiction)
    assert json_response(conn, 200)["data"] == %{
      "id" => jurisdiction.id
    }
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, jurisdiction_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, jurisdiction_path(conn, :create), jurisdiction: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Jurisdiction, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, jurisdiction_path(conn, :create), jurisdiction: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    jurisdiction = Repo.insert! %Jurisdiction{}
    conn = put conn, jurisdiction_path(conn, :update, jurisdiction), jurisdiction: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Jurisdiction, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    jurisdiction = Repo.insert! %Jurisdiction{}
    conn = put conn, jurisdiction_path(conn, :update, jurisdiction), jurisdiction: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    jurisdiction = Repo.insert! %Jurisdiction{}
    conn = delete conn, jurisdiction_path(conn, :delete, jurisdiction)
    assert json_response(conn, 200)["data"]["id"]
    refute Repo.get(Jurisdiction, jurisdiction.id)
  end
end
