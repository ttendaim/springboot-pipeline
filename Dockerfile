FROM openjdk:8-jdk-alpine
WORKDIR /opt/app
COPY target/springboot.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]