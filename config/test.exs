use Mix.Config

config :ex_aws,
  apigateway: %{
    scheme: "http://",
    host: "127.0.0.1",
    region: "eu-west-1",
    port: 1234
  }
