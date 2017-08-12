defmodule Symbol do
  @moduledoc """
  Implements an Ecto.Type for `symbol` columns that we use in our data model,
  when we want to be able to compare things as atoms in Elixir.
  """

  @behaviour Ecto.Type

  def type, do: :string

  def cast(nil) do
    {:ok, nil}
  end

  def cast(string) when is_binary(string) do
    {:ok, String.to_atom(string)}
  end

  def cast(atom) when is_atom(atom) do
    {:ok, atom}
  end

  def cast(_) do
    :error
  end

  def load(string) do
    cast(string)
  end

  def dump(nil), do: {:ok, nil}

  def dump(atom) when is_atom(atom), do: {:ok, Atom.to_string(atom)}

  def dump(string) when is_binary(string), do: {:ok, string}

  def dump(_), do: :error
end
