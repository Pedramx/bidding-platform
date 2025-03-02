# --------- Builder Stage ---------
FROM maven:3.8.3-openjdk-17 AS builder
WORKDIR /build

# 1. Copy the entire repository to ensure the parent POM and all modules are visible to Maven
COPY . .

# 2. Build the entire monorepo, including domain-models
RUN mvn clean install -DskipTests

# 3. Switch to the stream-processor-service module directory
WORKDIR /build/services/stream-processor-service

# 4. Build the stream-processor-service module (skip tests for faster builds)
RUN mvn clean package -DskipTests

# --------- Runtime Stage ---------
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy the built JAR from the builder stage
COPY --from=builder /build/services/stream-processor-service/target/stream-processor-service-*.jar app.jar

# Expose the application port
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
