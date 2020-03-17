FROM openjdk:8-jre

LABEL version="1.0.0"
LABEL repository="https://github.com/beyondcoding-life/firebase-action"
LABEL homepage="https://github.com/beyondcoding-life/firebase-action"
LABEL maintainer="Xi Ming <v8main@github.com>"

LABEL com.github.actions.name="GitHub Action for Firebase testing"
LABEL com.github.actions.description="Wraps the firebase-tools CLI to enable firebase testing."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="gray-dark"

RUN npm install -g firebase-tools
RUN npm install -g jest

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
