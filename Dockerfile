FROM openjdk:8-jre-slim
MAINTAINER Manthan Fursule
RUN mkdir /usr/src/myapp
ADD **/*.jar /usr/src/myapp
WORKDIR /usr/src/myapp
CMD ["java","-cp","target/Calculator-1.0-SNAPSHOT.jar","com/calculator/Calculator"]