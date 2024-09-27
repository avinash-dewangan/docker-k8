FROM openjdk:18-alpine AS builder
WORKDIR /project-name

COPY target/project-name-0.0.1-SNAPSHOT.jar /project-name/project-name-0.0.1-SNAPSHOT.jar

CMD ["java", "-jar", "project-name-0.0.1-SNAPSHOT.jar"]
