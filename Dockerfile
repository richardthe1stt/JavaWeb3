# Build stage
FROM maven:3.9.9-eclipse-temurin-11 AS build

WORKDIR /app

COPY . .

RUN mvn packaga

# App via apache tomcat
FROM tomcat:11.0.6-jdk21-temurin-noble

COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]