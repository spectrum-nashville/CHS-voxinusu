defmodule Chs.User do
  use Chs.Web, :model

  schema "users" do
    field :name, :string
    field :age, :integer
    field :email, :string
    field :username, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :age, :email, :username])
    |> validate_required([:name, :age, :email, :username])
  end
end
