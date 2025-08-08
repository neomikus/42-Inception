<h1>🐳 42-Inception 🐳</h1>
Inception is a systems and virtualization <a href="https://www.42network.org/">42 School</a> project. The goal is to build a secure, scalable, and containerized web infrastructure using Docker and Docker Compose, while applying best practices in system configuration and service orchestration.

<img src="./Inception Flowchart.png" style="width: 60vw;"></img>

<h2>🎯 Objectives 🎯</h2>
<ul>
  <li> Set up an Nginx entrypoint capable of handling requests to the server through the SSL standard port </li>
  <li> Set up a fully functional Wordpress instance </li>
  <li> Set up a fully functional MariaDB instance </li>
  <li> Fully encrypted and secure connection through TLS 1.3 (self-signed cert generated on each instance) </li>
  <li> Configure from scratch services to run on a virtualized container using Alpine Linux </li>
  <li> Ensure containers restart automatically and are isolated properly </li>
  <li> Configure PHP for FastCGI requests </li>
  <li> Implement a robust Docker Compose setup for fast and standarized project depolyment </li>
  <li> Secure data management by implementing Docker Secrets function and hidden, written on deployment enviroment variables </li>
</ul>

<h2>⚒️ Services used ⚒️</h2>
<h3>🚪 Nginx (with TLS 1.3) 🚪</h3>
Acts as the web server and reverse proxy. It handles incoming HTTP/HTTPS requests, serves static content, and forwards dynamic requests to the WordPress container. It's also configured with SSL to secure connections
<h3>📝 Wordpress with PHP FastCGI 📝</h3>
The core content management system (CMS) of the project. It provides the user interface for creating and managing the website, and communicates with the MariaDB database to store and retrieve content. It also hosts the php FastCGI program
<h3>🛢️ MariaDB 🛢️</h3>
A lightweight, open-source relational database. It stores all WordPress data—posts, users, settings—and ensures fast, reliable access for the WordPress service

<h2>📁 Project Structure 📁</h2>

```
inception/
├── secrets/
|     Empty folder (created on build)
├── srcs/
|   ├── requirements/
│   |   ├── wordpress/
│   |   ├── nginx/
│   |   └── mariadb/
|   ├── .env
|   └── docker-compose.yml
└── Makefile
```
