defmodule Nested.Role do
  use Nested.Web, :model

  schema "roles" do
    field :name, :string

    has_many :uses_roles, Nested.UserRole
    has_many :roles, through: [:uses_roles, :role]

    timestamps
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
