defmodule ExAws.ApiGateway.ApiKey do
  defstruct [
    :id,
    :value,
    :name,
    :customer_id,
    :description,
    :enabled,
    :stage_keys,
    :created_date,
    :last_updated_date
  ]
end
