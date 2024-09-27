FROM openjdk:18-alpine AS builder
WORKDIR /edistrict-user-management

COPY target/user-management-0.0.1-SNAPSHOT.jar /edistrict-user-management/user-management-0.0.1-SNAPSHOT.jar

CMD ["java", "-jar", "user-management-0.0.1-SNAPSHOT.jar"]
