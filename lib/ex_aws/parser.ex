defmodule ExAws.ApiGateway.Parser do
  @moduledoc """
  Parser for ExAws ApiGateway
  """

  @structs %{
    get_apis_keys: %ExAws.ApiGateway.ApiKey{},
    get_rest_apis: %ExAws.ApiGateway.RestApi{},
    create_apis_keys: %ExAws.ApiGateway.ApiKey{}
  }

  def parse({:ok, %{body: body}}, method) do
    # TODO : Add Errors management
    {:ok,
     body
     |> Poison.decode!()
     |> decode(method)}
  end

  defp decode(%{"_embedded" => item}, method) do
    decode(item, method)
  end

  defp decode(%{"item" => items}, method) when is_list(items) do
    Enum.map(items, &to_struct(&1, method))
  end

  defp decode(%{"item" => item}, method) do
    to_struct(item, method)
  end

  defp decode(%{"id" => id} = map, method) do
    to_struct(map, method)
  end

  defp to_struct(%{} = map, method) do
    struct = @structs |> Map.fetch!(method)
    [_ | keys] = Map.keys(struct)

    map
    |> Map.take(Enum.map(keys, &(Atom.to_string(&1) |> Recase.to_camel())))
    |> Enum.map(fn {k, v} ->
      {String.to_existing_atom(k |> Macro.underscore()), v}
    end)
    |> (fn data -> struct(struct.__struct__, data) end).()
  end
end
