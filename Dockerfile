FROM alpine AS plantuml-provider

RUN apk add --no-cache \
  wget

RUN wget \
  https://sourceforge.net/projects/plantuml/files/plantuml.jar/download \
  -O /plantuml.jar

FROM adoptopenjdk/openjdk14:alpine-jre

RUN apk add --no-cache \
  graphviz \
  ttf-dejavu \
  font-noto-cjk \
  font-noto-cjk-extra

COPY entrypoint.sh /entrypoint.sh
ENV PLANTUML_JAR="/plantuml.jar"

COPY --from=plantuml-provider /plantuml.jar "$PLANTUML_JAR"

WORKDIR /data
ENTRYPOINT ["/entrypoint.sh"]
