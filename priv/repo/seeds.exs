# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HipsterskaStrona.Repo.insert!(%HipsterskaStrona.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

HipsterskaStrona.Repo.delete_all HipsterskaStrona.User

HipsterskaStrona.User.changeset(%HipsterskaStrona.User{}, %{name: "Tomek", email: "tomek.diakow@gmail.com", password: "morszczuk", password_confirmation: "morszczuk", admin: true})
|> HipsterskaStrona.Repo.insert!
