# ExAws.ApiGateway

Service module for https://github.com/ex-aws/ex_aws

## Installation

The package can be installed by adding `ex_aws_api_gateway` to your list of dependencies in `mix.exs`
along with `:ex_aws` and your preferred JSON codec / http client

```elixir
def deps do
  [
    {:ex_aws, "~> 2.0"},
    {:ex_aws_api_gateway, "~> 0.9"},
    {:poison, "~> 3.0"},
    {:hackney, "~> 1.9"},
  ]
end
```

Documentation can be found at [https://hexdocs.pm/ex_aws_api_gateway](https://hexdocs.pm/ex_aws_api_gateway).

## Todo

Based on [Amazon API Gateway REST API Reference](https://docs.aws.amazon.com/apigateway/api-reference/link-relation/)

- [ ] account:update
- [x] apigateway:api-keys
- [ ] apigateway:client-certificates
- [ ] apigateway:domain-names
- [x] apigateway:rest-apis
- [ ] apigateway:usage-plans
- [ ] apigateway:vpc-links
- [ ] apikey:by-key
- [x] apikey:create
- [ ] apikey:delete
- [ ] apikey:import
- [ ] apikey:update
- [ ] apikey:usageplans
- [ ] authorizer:by-id
- [ ] authorizer:create
- [ ] authorizer:delete
- [ ] authorizer:update
- [ ] basepathmapping:by-base-path
- [ ] basepathmapping:by-path
- [ ] basepathmapping:create
- [ ] basepathmapping:delete
- [ ] basepathmapping:update
- [ ] clientcertificate:by-id
- [ ] clientcertificate:delete
- [ ] clientcertificate:generate
- [ ] clientcertificate:update
- [ ] deployment:by-id
- [ ] deployment:create
- [ ] deployment:delete
- [ ] deployment:stages
- [ ] deployment:update
- [ ] documentationpart:by-id
- [ ] documentationpart:create
- [ ] documentationpart:delete
- [ ] documentationpart:import
- [ ] documentationpart:update
- [ ] documentationversion:by-version
- [ ] documentationversion:create
- [ ] documentationversion:delete
- [ ] documentationversion:update
- [ ] domainname:basepathmappings
- [ ] domainname:by-name
- [ ] domainname:create
- [ ] domainname:delete
- [ ] domainname:update
- [ ] gatewayresponse:by-type
- [ ] gatewayresponse:delete
- [ ] gatewayresponse:put
- [ ] gatewayresponse:update
- [ ] integration:delete
- [ ] integration:put
- [ ] integration:responses
- [ ] integration:update
- [ ] integrationresponse:delete
- [ ] integrationresponse:put
- [ ] integrationresponse:update
- [ ] method:by-http-method
- [ ] method:delete
- [ ] method:integration
- [ ] method:put
- [ ] method:responses
- [ ] method:update
- [ ] methodresponse:delete
- [ ] methodresponse:put
- [ ] methodresponse:update
- [ ] model:by-name
- [ ] model:create
- [ ] model:delete
- [ ] model:generate-template
- [ ] model:update
- [ ] requestvalidator:by-id
- [ ] requestvalidator:create
- [ ] requestvalidator:delete
- [ ] requestvalidator:update
- [ ] resource:by-id
- [ ] resource:create-child
- [ ] resource:create
- [ ] resource:delete
- [ ] resource:methods
- [ ] resource:update
- [ ] restapi:authorizers
- [ ] restapi:by-id
- [ ] restapi:create
- [ ] restapi:delete
- [ ] restapi:deployments
- [ ] restapi:documentation-parts
- [ ] restapi:documentation-versions
- [ ] restapi:gateway-responses
- [ ] restapi:import
- [ ] restapi:models
- [ ] restapi:put
- [ ] restapi:request-validators
- [ ] restapi:resources
- [ ] restapi:stages
- [ ] restapi:update
- [ ] sdktype:by-id
- [ ] stage:by-name
- [ ] stage:create
- [ ] stage:delete
- [ ] stage:flush-authorizer-cache
- [ ] stage:flush-cache
- [ ] stage:update
- [ ] tags:get
- [ ] tags:tag
- [ ] tags:untag
- [ ] usage:get
- [ ] usage:update
- [ ] usageplan:by-id
- [ ] usageplan:create
- [ ] usageplan:delete
- [ ] usageplan:update
- [ ] usageplan:usageplankeys
- [ ] usageplankey:by-id
- [ ] usageplankey:create
- [ ] usageplankey:delete
- [ ] vpclink:by-id
- [ ] vpclink:create
- [ ] vpclink:delete
- [ ] vpclink:update

## License

The MIT License (MIT)

Copyright (c) 2019 Florian L.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
