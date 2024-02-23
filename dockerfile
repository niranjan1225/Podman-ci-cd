# Use a base image with Java 17 installed
FROM adoptopenjdk/openjdk17:alpine
# Set the working directory inside the container
WORKDIR /app
# Copy the Maven executable to the container image
COPY mvnw .
COPY .mvn .mvn
# Copy the Maven wrapper files
COPY mvnw.cmd .
# Copy the project descriptor files
COPY pom.xml .
# Download dependencies
RUN ./mvnw dependency:go-offline
# Copy the application source code
COPY src src
# Expose the port that the Spring Boot application will run on
EXPOSE 8080

# Run the Spring Boot application
CMD ["java", "-jar", "target/sample-0.0.1-SNAPSHOT.jar"]