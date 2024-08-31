# inception

1. Start with MariaDB
Why?

Foundation for WordPress: MariaDB is the database service that WordPress relies on to store its data. Without a working database, WordPress cannot function properly. Therefore, it's essential to have the database set up and running first.
Simplicity: Setting up MariaDB is relatively straightforward, and it gives you a good starting point to get familiar with writing Dockerfiles and configuring containers.
Steps:

Create a Dockerfile for MariaDB.
Configure the database in the Dockerfile, ensuring it’s secure (no hardcoded passwords).
Set up the Docker volume to persist the database data.
Test the container independently to ensure MariaDB runs properly.
2. Move on to WordPress
Why?

Dependency on MariaDB: WordPress requires a database to store its content and settings. Since you’ve already set up MariaDB, you can now configure WordPress to connect to it.
Complexity: WordPress is a bit more complex as it involves setting up PHP-FPM and configuring it to work without NGINX in the container, which is a useful exercise in understanding containerized services.
Steps:

Create a Dockerfile for WordPress using PHP-FPM.
Configure WordPress to connect to the MariaDB container using environment variables.
Set up the Docker volume for WordPress files.
Test the WordPress container independently by connecting it to the MariaDB container to ensure it works properly.
3. Set Up NGINX
Why?

Final Layer: NGINX will act as the front-end server, handling incoming requests, securing connections with TLS, and serving WordPress. Setting it up last allows you to focus on how it will interact with the other containers (WordPress and MariaDB).
Complexity with TLS: NGINX requires careful configuration to handle SSL/TLS traffic securely, so it’s better to address this once you’re confident that the backend services are functioning correctly.
Steps:

Create a Dockerfile for NGINX.
Configure NGINX to handle TLS (using certificates) and act as a reverse proxy for the WordPress service.
Ensure NGINX is set to only allow traffic on port 443.
Test NGINX by accessing the WordPress site through it, making sure that the SSL/TLS configuration works as expected.
4. Integrate with Docker Compose
Why?

Orchestration: Once all individual services are working correctly, you can use Docker Compose to manage them as a cohesive unit. This step ensures that all services are brought up in the correct order, with the necessary dependencies and network configurations.
Steps:

Write the docker-compose.yml file to define the services, volumes, and network.
Use environment variables and secrets for configuration.
Bring up the entire stack using docker-compose up and test the complete setup.
5. Final Configuration and Testing
Domain and Networking: Configure your local domain to point to the NGINX container and test the entire infrastructure end-to-end.
Resilience: Test the container restart policies by simulating crashes and ensuring services come back online.
Security: Double-check that no passwords are hardcoded, and all sensitive information is stored securely.
