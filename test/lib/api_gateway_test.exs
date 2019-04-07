defmodule ExAws.ApiGatewayTest do
  use ExUnit.Case, async: true

  @region "eu-west-1"
  @usage_plan_id "0v2i30"
  @api_key "m6jag7ci1m"

  # I start tests on real env, this is why I skip some tests. But be sure, it works ;-)

  @tag :skip
  test "#create_apis_keys" do
    assert {:ok, %ExAws.ApiGateway.ApiKey{id: _, value: _}} =
             ExAws.ApiGateway.create_apis_keys(%{
               name: "Key from Lib Tests",
               customerId: "internalCustomerId",
               enabled: true
             })
             |> ExAws.request(region: @region)
  end

  @tag :skip
  test "#associate_usage_plan" do
    assert {:ok, %ExAws.ApiGateway.UsagePlanKey{id: _}} =
             ExAws.ApiGateway.associate_usage_plan(%{
               keyId: @api_key,
               keyType: "API_KEY",
               usageplanId: @usage_plan_id
             })
             |> ExAws.request(region: @region)
  end

  # @tag :skip
  test "#disassociate_usage_plan" do
    assert {:ok, nil} =
             ExAws.ApiGateway.disassociate_usage_plan(%{
               keyId: @api_key,
               usageplanId: @usage_plan_id
             })
             |> ExAws.request(region: @region)
  end

  @tag :skip
  test "#usage_by_api_key" do
    assert {:ok, [{_id, [_ | _]} | _]} =
             ExAws.ApiGateway.usage_by_api_key(%{usageplanId: @usage_plan_id, keyId: @api_key})
             |> ExAws.request(region: @region)
  end

  @tag :skip
  test "#get_apis_keys" do
    assert {:ok, [%ExAws.ApiGateway.ApiKey{id: _} | _]} =
             ExAws.ApiGateway.get_apis_keys()
             |> ExAws.request(region: @region)
  end

  @tag :skip
  test "#get_usage_plans" do
    assert {:ok, [%ExAws.ApiGateway.UsagePlan{id: _} | _]} =
             ExAws.ApiGateway.get_usage_plans()
             |> ExAws.request(region: @region)
  end

  @tag :skip
  test "#get_rest_apis" do
    assert {:ok, %ExAws.ApiGateway.RestApi{id: _}} =
             ExAws.ApiGateway.get_rest_apis()
             |> ExAws.request(region: @region)
  end
end
