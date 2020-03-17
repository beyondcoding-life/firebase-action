FROM openjdk:7

LABEL version="1.1.1"
LABEL repository="https://github.com/beyondcoding-life/firebase-action"
LABEL homepage="https://github.com/beyondcoding-life/firebase-action"
LABEL maintainer="Xi Ming <v8main@github.com>"

LABEL com.github.actions.name="GitHub Action for Firebase testing"
LABEL com.github.actions.description="Wraps the firebase-tools CLI to enable firebase testing."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="gray-dark"



RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
    nodejs \
    yarn \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get install openjdk-8-jre

RUN yarn global add firebase-tools
RUN yarn global add jest

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
