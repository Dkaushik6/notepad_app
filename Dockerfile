# Use a base image with Maven and OpenJDK
FROM maven:3.8.4-openjdk-11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and source code into the container
COPY pom.xml .
COPY . . 

# Build the application (this will create the JAR file)
RUN mvn clean package

# Copy the JAR file to the current directory
COPY target/*.jar app.jar

# Specify the command to run your application
ENTRYPOINT ["java", "-jar", "app.jar"]

# Expose any ports your application needs (adjust as necessary)
EXPOSE 80
