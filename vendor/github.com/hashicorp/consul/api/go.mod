module github.com/hashicorp/consul/api

go 1.12

replace github.com/hashicorp/consul/sdk => ../sdk

require (
<<<<<<< HEAD
	github.com/hashicorp/consul/sdk v0.1.0
	github.com/hashicorp/go-cleanhttp v0.5.1
	github.com/hashicorp/go-rootcerts v1.0.0
	github.com/hashicorp/go-uuid v1.0.1
	github.com/hashicorp/serf v0.8.2
	github.com/mitchellh/mapstructure v1.1.2
	github.com/pascaldekloe/goe v0.0.0-20180627143212-57f6aae5913c
	github.com/stretchr/testify v1.3.0
=======
	github.com/hashicorp/consul/sdk v0.4.0
	github.com/hashicorp/go-cleanhttp v0.5.1
	github.com/hashicorp/go-hclog v0.12.0
	github.com/hashicorp/go-rootcerts v1.0.2
	github.com/hashicorp/go-uuid v1.0.1
	github.com/hashicorp/serf v0.8.2
	github.com/mitchellh/mapstructure v1.1.2
	github.com/stretchr/testify v1.4.0
>>>>>>> 240b09bc5b01223a1e23df45e12a6b41dfb52f19
)
