FROM alpine:latest

LABEL description="NetSuite CLI"
LABEL version="17.1"

WORKDIR /opt/ns-cli 

ADD com.netsuite.ide.core_2017.2.0.jar .
ADD pom.xml .
ADD sdfcli .

RUN apk update && apk add openjdk8 && apk add expect

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH "$PATH:/opt/ns-cli"

RUN apk add maven && mvn verify

CMD sh sdfcli -h 
