# Use a base image with Maven and OpenJDK
FROM maven:3.8-openjdk-17 AS build

# Set working directory
WORKDIR /app

# Copy the pom.xml file to the container
COPY pom.xml .

# Download dependencies
RUN mvn dependency:go-offline

# Copy the application source code to the container
COPY src C:\Users\Kalpana Sundar\OneDrive\Desktop\Springboot\demo

# Build the application
RUN mvn package -DskipTests

# Use a base image with OpenJDK only
FROM openjdk:17-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file from the previous stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port the application runs on
EXPOSE 8090

# Run the JAR file
CMD ["java", "-jar", "app.jar"]
