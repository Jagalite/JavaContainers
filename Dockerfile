#FROM alpine/git
#WORKDIR /app
#RUN git clone https://github.com/spring-guides/gs-rest-service

#FROM maven:3.5-jdk-8-alpine
#WORKDIR /app
#COPY --from=0 /app/gs-rest-service/complete /app
#RUN mvn package

FROM ubuntu
RUN apt-get update && apt-get install
#RUN apt-get install -y git
RUN apt-get install -y maven
RUN apt-get install -y openjdk-8-jdk

WORKDIR /Git
ADD . /Git
RUN ls -ltr
#RUN git clone https://github.com/spring-guides/gs-rest-service

WORKDIR /Git/complete
RUN mvn package

WORKDIR /Git/gs-rest-service/complete/target
RUN ls -ltr

#FROM tomcat:latest
#COPY --from=0 /app/gs-rest-service/complete
