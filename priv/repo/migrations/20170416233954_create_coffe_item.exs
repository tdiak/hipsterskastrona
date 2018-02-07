defmodule HipsterskaStrona.Repo.Migrations.CreateCoffeItem do
  use Ecto.Migration

  def change do
    create table(:coffe) do
      add :name, :string
      add :lng, :float
      add :lat, :float

      timestamps()
    end

  end
end
