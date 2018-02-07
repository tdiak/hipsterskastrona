defmodule HipsterskaStrona.CoffeItemControllerTest do
  use HipsterskaStrona.ConnCase

  alias HipsterskaStrona.CoffeItem
  @valid_attrs %{lat: "120.5", lng: "120.5", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, coffe_item_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing coffe"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, coffe_item_path(conn, :new)
    assert html_response(conn, 200) =~ "New coffe item"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, coffe_item_path(conn, :create), coffe_item: @valid_attrs
    assert redirected_to(conn) == coffe_item_path(conn, :index)
    assert Repo.get_by(CoffeItem, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, coffe_item_path(conn, :create), coffe_item: @invalid_attrs
    assert html_response(conn, 200) =~ "New coffe item"
  end

  test "shows chosen resource", %{conn: conn} do
    coffe_item = Repo.insert! %CoffeItem{}
    conn = get conn, coffe_item_path(conn, :show, coffe_item)
    assert html_response(conn, 200) =~ "Show coffe item"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, coffe_item_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    coffe_item = Repo.insert! %CoffeItem{}
    conn = get conn, coffe_item_path(conn, :edit, coffe_item)
    assert html_response(conn, 200) =~ "Edit coffe item"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    coffe_item = Repo.insert! %CoffeItem{}
    conn = put conn, coffe_item_path(conn, :update, coffe_item), coffe_item: @valid_attrs
    assert redirected_to(conn) == coffe_item_path(conn, :show, coffe_item)
    assert Repo.get_by(CoffeItem, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    coffe_item = Repo.insert! %CoffeItem{}
    conn = put conn, coffe_item_path(conn, :update, coffe_item), coffe_item: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit coffe item"
  end

  test "deletes chosen resource", %{conn: conn} do
    coffe_item = Repo.insert! %CoffeItem{}
    conn = delete conn, coffe_item_path(conn, :delete, coffe_item)
    assert redirected_to(conn) == coffe_item_path(conn, :index)
    refute Repo.get(CoffeItem, coffe_item.id)
  end
end
