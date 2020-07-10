## Building container image

Compile sources and build a Docker image
```
docker build . -t <your container registry>/shopping-service:latest
```
Publish the image
```
docker push <your container registry>/shopping-service:latest
```
