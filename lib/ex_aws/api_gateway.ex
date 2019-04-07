defmodule ExAws.ApiGateway do
  @moduledoc """
  Operations on ExAws ApiGateway

  Read more on AWS Gateway API : [Official documentation](https://github.com/aws/aws-sdk-go/blob/master/models/apis/apigateway/2015-07-09/api-2.json)

  ## Examples

  See some examples

  ### Getting all the ApiKeys resource

      iex> ExAws.ApiGateway.get_apis_keys() |> ExAws.request(region: @region)
      {:ok,
       [
         %ExAws.ApiGateway.UsagePlan{
           api_stages: %{"apiId" => "...", "stage" => "dev", "throttle" => nil},
           description: nil,
           id: "...",
           name: "Basic",
           quota: %{"limit" => 10000000, "offset" => 0, "period" => "MONTH"},
           throttle: nil
         },
         ...
       ]}

  """

  require Logger

  @doc "Get all API keys"
  @spec get_apis_keys() :: ExAws.Operation.JSON.t()
  def get_apis_keys() do
    request(:get, :api_key, "/apikeys?includeValues=true")
  end

  @doc "Get all APIs"
  @spec get_rest_apis() :: ExAws.Operation.JSON.t()
  def get_rest_apis() do
    request(:get, :rest_api, "/restapis")
  end

  @doc "Get all usage plans"
  @spec get_usage_plans() :: ExAws.Operation.JSON.t()
  def get_usage_plans() do
    request(:get, :usage_plan, "/usageplans")
  end

  @doc "Get usage for specific api key"
  @type usage_by_api_key_opts :: [
          {:usageplanId, binary}
          | {:keyId, binary}
          | {:startDate, binary}
          | {:endDate, binary}
          | {:limit, integer}
        ]
  @spec usage_by_api_key(params :: usage_by_api_key_opts) :: ExAws.Operation.JSON.t()
  def usage_by_api_key(params) do
    defaults = %{startDate: "2019-04-01", endDate: "2019-04-02"}
    params = Map.merge(defaults, params)

    request(
      :get,
      nil,
      "/usageplans/#{params[:usageplanId]}/usage?" <> URI.encode_query(params)
    )
  end

  @doc "Associate an existing API key to the specified usage plan"
  @type associate_usage_plan_opts :: [
          {:usageplanId, binary}
          | {:keyId, binary}
          | {:keyType, binary}
        ]
  @spec associate_usage_plan(data :: associate_usage_plan_opts) :: ExAws.Operation.JSON.t()
  def associate_usage_plan(data) do
    request(:post, :usage_plan_key, "/usageplans/#{data[:usageplanId]}/keys", data)
  end

  @doc "Associate an existing API key to the specified usage plan"
  @spec disassociate_usage_plan(data :: associate_usage_plan_opts) :: ExAws.Operation.JSON.t()
  def disassociate_usage_plan(data) do
    request(:delete, :usage_plan_key, "/usageplans/#{data[:usageplanId]}/keys/#{data[:keyId]}")
  end

  @doc "Create a new api key"
  @type create_apis_keys_opts :: [
          {:name, binary}
          | {:description, binary}
          | {:customerId, binary}
          | {:enabled, boolean}
        ]
  @spec create_apis_keys(data :: create_apis_keys_opts) :: ExAws.Operation.JSON.t()
  def create_apis_keys(data) do
    request(:post, :api_key, "/apikeys", data)
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
