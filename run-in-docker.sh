#!/bin/bash -x

docker build inventory -t lightbend-docker-registry.bintray.io/cloudstate-samples/inventory:latest
docker build shopping-cart -t lightbend-docker-registry.bintray.io/cloudstate-samples/shopping-cart:latest
docker build shopping-service -t lightbend-docker-registry.bintray.io/cloudstate-samples/shopping-service:latest

docker-compose up
