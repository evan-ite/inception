# Inception

## Project Overview
This project is a Docker Compose setup that includes multiple services to create a fully functional web environment. The services included are:

- **MariaDB**: A robust and scalable relational database management system.
- **WordPress**: A popular content management system (CMS) for creating websites and blogs.
- **Nginx**: A high-performance web server and reverse proxy server.
- **Adminer**: A lightweight database management tool for managing MariaDB.
- **Static Website**: A simple static website served by Nginx.

## Services

### MariaDB
MariaDB is used as the database management system for the WordPress site. It stores all the data related to the WordPress site, including posts, pages, and user information.

### WordPress
WordPress is the CMS used to create and manage the content of the website. It connects to the MariaDB database to store and retrieve data.

### Nginx
Nginx is used as the web server to serve the WordPress site and the static website. It also acts as a reverse proxy for the Adminer service.

### Adminer
Adminer is a lightweight database management tool that allows you to manage the MariaDB database through a web interface.

### Static Website
A simple static website is also served by Nginx. This can be used to serve static content like HTML, CSS, and JavaScript files.

## Setup and Installation

### Prerequisites
- Docker
- Docker Compose

### Installation Steps
1. **Clone the Repository**:
```sh
git clone https://github.com/evan-ite/inception.git
cd inception
```

Now change the temp.env file to add your own users and passwords.
```sh
mv temp.env .env
```

Keys and salts will be generated automatically by `srcs/requirements/tools/generate_keys.sh`. 

Now you're ready to run the project!
```sh
make up
```
