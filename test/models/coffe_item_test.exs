defmodule HipsterskaStrona.CoffeItemTest do
  use HipsterskaStrona.ModelCase

  alias HipsterskaStrona.CoffeItem

  @valid_attrs %{lat: "120.5", lng: "120.5", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = CoffeItem.changeset(%CoffeItem{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = CoffeItem.changeset(%CoffeItem{}, @invalid_attrs)
    refute changeset.valid?
  end
end
