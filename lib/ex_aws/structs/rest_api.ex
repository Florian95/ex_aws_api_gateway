defmodule ExAws.ApiGateway.RestApi do
  defstruct [
    :id,
    :name,
    :description,
    :version,
    :api_key_source,
    :endpoint_configuration,
    :policy
  ]
end
