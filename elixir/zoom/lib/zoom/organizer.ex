defmodule Zoom.Organizer do
  @moduledoc """
  The Organizer context.
  """

  import Ecto.Query, warn: false
  alias Zoom.Repo

  alias Zoom.Organizer.Room

  def list_rooms do
    Repo.all(Room)
  end

  def get_room!(id), do: Repo.get!(Room, id)

  def get_room(slug) when is_binary(slug) do
    from(room in Room, where: room.slug == ^slug)
    |> Repo.one()
  end

  def create_room(attrs \\ %{}) do
    %Room{}
    |> Room.changeset(attrs)
    |> Repo.insert()
  end

  def update_room(%Room{} = room, attrs) do
    room
    |> Room.changeset(attrs)
    |> Repo.update()
  end

  def delete_room(%Room{} = room) do
    Repo.delete(room)
  end

  def change_room(%Room{} = room, attrs \\ %{}) do
    Room.changeset(room, attrs)
  end
end
