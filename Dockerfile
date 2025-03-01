# Stage 1: Build the application
FROM openjdk:17-jdk-slim as build

# Install Git and Maven
RUN apt-get update && apt-get install -y git maven && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /blog

# Clone the project from GitHub
RUN git clone https://github.com/paskal98/blog.git .

# Build the project using Maven
RUN mvn clean install -DskipTests

# Stage 2: Create the runtime image with Maven included
FROM openjdk:17-jdk-slim

# Install Git, Maven, and PostgreSQL client
RUN apt-get update && \
    apt-get install -y git maven postgresql-client && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the entire project directory including the .git directory and pom.xml from the build stage
COPY --from=build /blog .

# Copy the entrypoint.sh script
COPY entrypoint.sh /app/entrypoint.sh

# Make entrypoint.sh executable
RUN chmod +x /app/entrypoint.sh

# Copy the wait-for-postgres.sh script
COPY wait-for-postgres.sh /app/wait-for-postgres.sh

# Make wait-for-postgres.sh executable
RUN chmod +x /app/wait-for-postgres.sh

# Command to run the project
CMD ["/app/wait-for-postgres.sh", "db", "/app/entrypoint.sh"]
