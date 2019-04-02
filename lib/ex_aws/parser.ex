defmodule ExAws.ApiGateway.Parser do
  @moduledoc """
  Parser for ExAws ApiGateway
  """

  @structs %{
    api_key: %ExAws.ApiGateway.ApiKey{},
    rest_api: %ExAws.ApiGateway.RestApi{},
    usage_plan: %ExAws.ApiGateway.UsagePlan{},
    usage_plan_key: %ExAws.ApiGateway.UsagePlanKey{}
  }

  def parse({:ok, %{body: body}}, method) do
    # TODO : Add Errors management
    {:ok,
     body
     |> Poison.decode!()
     |> decode(method)}
  end

  def parse({:error, {:http_error, _error_code, %{body: body}}}, _method) do
    {:error,
     body
     |> Poison.decode!()}
  end

  defp decode(%{"_embedded" => item}, method) do
    decode(item, method)
  end

  defp decode(%{"item" => items}, method) when is_list(items) do
    Enum.map(items, &to_struct(&1, method))
  end

  defp decode(%{"values" => items}, method) do
    Enum.map(items, &to_struct(&1, method))
  end

  defp decode(%{"item" => item}, method) do
    to_struct(item, method)
  end

  defp decode(%{"id" => _} = map, method) do
    to_struct(map, method)
  end

  defp to_struct({_key, _values} = tuple, _method) do
    tuple
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
