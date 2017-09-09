FROM alpine:latest

LABEL description="NetSuite SDF CLI"
LABEL version="2017.2.0"

WORKDIR /opt/ns-cli 

ADD com.netsuite.ide.core_2017.2.0.jar .
ADD pom.xml .
ADD sdfcli .
ADD install-core.sh .

RUN apk update && apk add openjdk8

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH "$PATH:/opt/ns-cli"

RUN apk add maven
RUN sh /opt/ns-cli/install-core.sh
RUN mvn package

CMD sh sdfcli -h 
