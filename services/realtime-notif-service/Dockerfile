FROM eclipse-temurin:17-jdk-alpine as builder

WORKDIR /app
COPY pom.xml ./
COPY src ./src
RUN ./mvnw clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /app/target/bid-gateway-service-*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
