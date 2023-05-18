FROM gradle:7.6.1-jdk17 AS build
COPY  . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle assemble
# https://hub.docker.com/_/openjdk/tags?page=1&name=17-slim
FROM openjdk:17-ea-17-slim-buster
EXPOSE 8080
RUN mkdir /app
COPY --from=build /home/gradle/src/build/libs/*.jar /app/spring-boot-application.jar
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=production","/app/spring-boot-application.jar"]