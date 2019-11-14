FROM openjdk:8-jdk

ENV BITBUCKET_VERSION=5.10.0 BITBUCKET_FOLDER=/opt/BITBUCKET BITBUCKET_HOME=/opt/bitbucket/data

EXPOSE 8085

RUN ([ -d $BITBUCKET_FOLDER ] || mkdir -p $BITBUCKET_FOLDER) \
    && [ -d $BITBUCKET_FOLDER/app ] \
    || cd  $BITBUCKET_FOLDER \
    && wget "https://product-downloads.atlassian.com/software/stash/downloads/atlassian-bitbucket-${BITBUCKET_VERSION}.tar.gz" \
    && tar -xvf atlassian-bitbucket-${BITBUCKET_VERSION}.tar.gz && mv atlassian-bitbucket-${BITBUCKET_VERSION} app \
    && rm atlassian-bitbucket-${BITBUCKET_VERSION}.tar.gz

ENTRYPOINT $BITBUCKET_FOLDER/app/bin/start-bitbucket.sh -fg
