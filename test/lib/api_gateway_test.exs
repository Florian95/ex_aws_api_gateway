defmodule ExAws.ApiGatewayTest do
  use ExUnit.Case, async: true

  test "#create_apis_keys" do
    assert {:ok, %ExAws.ApiGateway.ApiKey{id: _, value: _}} =
             ExAws.ApiGateway.create_apis_keys(%{
               name: "Key from Lib Tests",
               customerId: "internalCustomerId",
               enabled: true
             })
             |> ExAws.request(region: "eu-west-1")
  end

  test "#get_apis_keys" do
    assert {:ok, [_ | _]} =
             ExAws.ApiGateway.get_apis_keys()
             |> ExAws.request(region: "eu-west-1")
  end

  test "#get_rest_apis" do
    assert {:ok, %ExAws.ApiGateway.RestApi{id: _}} =
             ExAws.ApiGateway.get_rest_apis()
             |> ExAws.request(region: "eu-west-1")
  end
end
