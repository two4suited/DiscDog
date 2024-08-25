api-create:	tp-create client-create

tp-create:
	tsp compile ./OpenApi --output-dir ./OpenApi --config ./OpenApi/tspconfig.yaml

client-create:
	kiota generate -d OpenApi/output/openapi3.yaml  -c DiscDogClient -n DiscDog.Client -o ./src/DiscDog.Shared/Client -l csharp -m application/json 