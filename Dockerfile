FROM openjdk:8-jdk

ENV BAMBOO_VERSION=6.2.2 BAMBOO_FOLDER=/opt/bamboo BAMBOO_HOME=/opt/bamboo/data

EXPOSE 8085

RUN ([ -d $BAMBOO_FOLDER ] || mkdir -p $BAMBOO_FOLDER) \
    && [ -d $BAMBOO_FOLDER/app ] \
    || cd  $BAMBOO_FOLDER \
    && wget "https://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-${BAMBOO_VERSION}.tar.gz" \
    && tar -xvf atlassian-bamboo-${BAMBOO_VERSION}.tar.gz && mv atlassian-bamboo-${BAMBOO_VERSION} app \
    && rm atlassian-bamboo-${BAMBOO_VERSION}.tar.gz

ENTRYPOINT $BAMBOO_FOLDER/app/bin/start-bamboo.sh -fg
