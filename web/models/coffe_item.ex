defmodule HipsterskaStrona.CoffeItem do
  use HipsterskaStrona.Web, :model

  schema "coffe" do
    field :name, :string
    field :lng, :float
    field :lat, :float

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :lng, :lat])
    |> validate_required([:name, :lng, :lat])
  end
end
