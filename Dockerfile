FROM frolvlad/alpine-oraclejdk8:slim
#FROM openjdk:8-jre
MAINTAINER LeeHuajun <lhj@cvtb.cn>
VOLUME /tmp
ARG JAR_FILE
ADD target/${JAR_FILE} app.jar
RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS="-Duser.timezone=GMT+8"
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]