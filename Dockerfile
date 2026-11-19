# ---------- Stage 1: build the WAR with Maven ----------
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app

# Cache dependencies first (faster rebuilds)
COPY pom.xml .
RUN mvn -B dependency:go-offline

# Copy source and build
COPY src ./src
RUN mvn -B clean package -DskipTests

# ---------- Stage 2: run on Tomcat 10.1 (Jakarta EE 10) ----------
FROM tomcat:10.1-jdk21-temurin

# Remove default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Deploy as CDList.war -> http://localhost:8080/CDList/
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/CDList.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
