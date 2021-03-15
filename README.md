## Install Kong
Follow steps [here](https://docs.konghq.com/enterprise/2.3.x/deployment/installation/docker/).

## Set up a service
Adapted from [here](https://docs.konghq.com/getting-started-guide/2.1.x/expose-services/).

Define a service
```
curl -i -X POST http://localhost:8001/services \
 --data name=example_service \
 --data url='http://mockbin.org'
```

Verify service
```
curl -i http://localhost:8001/services/example_service
```

Add a route
```
curl -i -X POST http://localhost:8001/services/example_service/routes \
  --data 'paths[]=/mock' \
  --data name=mocking
```

Verify the route
```
curl -i -X GET http://localhost:8000/mock/request
```

## Set up tracing from Kong
Add Zipkin
```
docker run -d -p 9411:9411 openzipkin/zipkin
```

Enable the plugin
```
curl -X POST http://localhost:8001/plugins/ \
    --data "name=zipkin"  \
    --data "config.http_endpoint=http://172.17.0.1:9411/api/v2/spans" \
    --data "config.sample_ratio=1.0" \
    --data "config.include_credential=true" \
    --data "config.traceid_byte_count=16" \
    --data "config.header_type=preserve" \
    --data "config.default_header_type=b3"
```
