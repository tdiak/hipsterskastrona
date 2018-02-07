defmodule HipsterskaStrona.CoffeItemController do
  use HipsterskaStrona.Web, :controller

  alias HipsterskaStrona.CoffeItem

  def index(conn, _params) do
    coffe = Repo.all(CoffeItem)
    render(conn, "index.html", coffe: coffe)
  end

  def new(conn, _params) do
    changeset = CoffeItem.changeset(%CoffeItem{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"coffe_item" => coffe_item_params}) do
    changeset = CoffeItem.changeset(%CoffeItem{}, coffe_item_params)

    case Repo.insert(changeset) do
      {:ok, _coffe_item} ->
        conn
        |> put_flash(:info, "Coffe item created successfully.")
        |> redirect(to: coffe_item_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    coffe_item = Repo.get!(CoffeItem, id)
    render(conn, "show.html", coffe_item: coffe_item)
  end

  def edit(conn, %{"id" => id}) do
    coffe_item = Repo.get!(CoffeItem, id)
    changeset = CoffeItem.changeset(coffe_item)
    render(conn, "edit.html", coffe_item: coffe_item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "coffe_item" => coffe_item_params}) do
    coffe_item = Repo.get!(CoffeItem, id)
    changeset = CoffeItem.changeset(coffe_item, coffe_item_params)

    case Repo.update(changeset) do
      {:ok, coffe_item} ->
        conn
        |> put_flash(:info, "Coffe item updated successfully.")
        |> redirect(to: coffe_item_path(conn, :show, coffe_item))
      {:error, changeset} ->
        render(conn, "edit.html", coffe_item: coffe_item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    coffe_item = Repo.get!(CoffeItem, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(coffe_item)

    conn
    |> put_flash(:info, "Coffe item deleted successfully.")
    |> redirect(to: coffe_item_path(conn, :index))
  end
end
