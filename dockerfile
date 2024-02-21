# Download dependencies
RUN ./mvnw dependency:go-offline
# Copy the application source code
COPY src src
# Expose the port that the Spring Boot application will run on
EXPOSE 8080
# Run the Spring Boot application
CMD ["java", "-jar", "sample-0.0.1-SNAPSHOT.jar"]