defmodule ExAws.ApiGateway.UsagePlan do
  defstruct [
    :id,
    :name,
    :description,
    :quota,
    :throttle,
    :api_stages
  ]
end
