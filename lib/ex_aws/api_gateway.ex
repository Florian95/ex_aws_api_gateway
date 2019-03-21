defmodule ExAws.ApiGateway do
  @moduledoc """
  Operations on ExAws ApiGateway
  """

  # Cf. https://github.com/aws/aws-sdk-go/blob/master/models/apis/apigateway/2015-07-09/api-2.json

  require Logger

  @doc "GetApiKeys"
  @spec get_apis_keys() :: ExAws.Operation.JSON.t()
  def get_apis_keys() do
    request(:get, :get_apis_keys, "/apikeys")
  end

  @doc "GetRestApis"
  @spec get_rest_apis() :: ExAws.Operation.JSON.t()
  def get_rest_apis() do
    request(:get, :get_rest_apis, "/restapis")
  end

  @doc "CreateApiKey"
  @type create_apis_keys_opts :: [
          {:name, binary}
          | {:description, binary}
          | {:customerId, binary}
          | {:enabled, boolean}
        ]
  @spec create_apis_keys(data :: create_apis_keys_opts) :: ExAws.Operation.JSON.t()
  def create_apis_keys(data) do
    request(:post, :create_apis_keys, "/apikeys", data)
  end

  defp request(http_method, action, path, data \\ %{}, params \\ []) do
    path = [path, "?", params |> URI.encode_query()] |> IO.iodata_to_binary()

    %ExAws.Operation.RestQuery{
      http_method: http_method,
      path: path,
      params: params,
      body: data,
      service: :apigateway,
      action: action,
      parser: &ExAws.ApiGateway.Parser.parse/2
    }
  end
end
