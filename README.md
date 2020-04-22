# plantuml-docker

A docker image with PlantUML.

Automatically built daily via [Docker Hub](https://hub.docker.com/repository/docker/mozgiii/plantuml).

## Usage

```shell
docker run --rm -v "$(pwd):/data" mozgiii/plantuml:latest -tpng /data/file.pu
```
