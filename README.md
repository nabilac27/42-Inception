*This project has been created as part of the 42 curriculum by nchairun.*

<p align="center">
  <img src="https://www.docker.com/app/uploads/2022/03/Moby-logo.png" width="85" alt="Docker"/>
</p>

<h1 align="center">
  Inception
</h1>


## Overview
A Docker-based infrastructure project consisting of:

- NGINX with TLS 1.2 or TLS 1.3
- WordPress with PHP-FPM
- MariaDB
- A private Docker network
- Persistent named volumes

The infrastructure runs inside a virtual machine and is managed through Docker Compose.

## Domain

```bash
  nabilac.42.fr
```


## Description
<!--
    A Project description section must also explain the use of Docker and the sources
    included in the project. 
    It must indicate the main design choices, as well as a
    comparison between:
    ◦ Virtual Machines vs Docker
    ◦ Secrets vs Environment Variables
    ◦ Docker Network vs Host Network
    ◦ Docker Volumes vs Bind Mounts
-->

---

## Instructions
### Compilation
<!--

-->

### Installation
<!--

-->


### Execution
<!--

-->


### Submission Requirements
<!--

-->


---

## Resources
### Documentation
### Docker
- Docker Documentation: https://docs.docker.com/
- Docker Compose: https://docs.docker.com/compose/
- Dockerfile Reference: https://docs.docker.com/reference/dockerfile/
- Docker Compose File Reference: https://docs.docker.com/reference/compose-file/
- Docker Networking: https://docs.docker.com/network/
- Docker Volumes: https://docs.docker.com/storage/volumes/
- Docker Secrets: https://docs.docker.com/engine/swarm/secrets/

### NGINX
- NGINX Documentation: https://nginx.org/en/docs/
- NGINX Beginner's Guide: https://nginx.org/en/docs/beginners_guide.html

### WordPress
- WordPress Documentation: https://wordpress.org/documentation/
- WP-CLI Documentation: https://developer.wordpress.org/cli/commands/

### PHP
- PHP Manual: https://www.php.net/docs.php
- PHP-FPM Configuration: https://www.php.net/manual/en/install.fpm.php

### MariaDB
- MariaDB Documentation: https://mariadb.com/kb/en/documentation/

### Security
- OpenSSL Documentation: https://docs.openssl.org/
- Mozilla SSL Configuration Generator: https://ssl-config.mozilla.org/

### Linux
- Debian Documentation: https://www.debian.org/doc/

### Articles and Tutorials
<!--

-->

### AI Usage
<!--

-->


---

## Concepts Learned

<details>
<summary><strong>Docker?</strong></summary>

* Docker is a platform for building, packaging, and running applications inside lightweight, isolated environments called **containers**. 

* Unlike traditional virtual machines, containers share the host operating system's kernel while keeping applications and their dependencies isolated from one another. This makes containers fast to start, portable across different systems, and efficient in resource usage.

* This project uses **Docker Compose** to orchestrate multiple containers that work together as a complete web infrastructure.

</details>

---

<details>
<summary><strong>Project Architecture</strong></summary>

The infrastructure consists of three independent services:

- **NGINX** acts as the only public entry point, serving HTTPS traffic using TLS 1.2/1.3.
- **WordPress + PHP-FPM** runs the web application and processes PHP requests.
- **MariaDB** stores the WordPress database.

The containers communicate through a private Docker bridge network, while persistent data is stored using Docker named volumes.

</details>

---

<details>
<summary><strong>Virtual Machines vs Docker Containers</strong></summary>

| Virtual Machine | Docker Container |
|-----------------|------------------|
| Virtualizes an entire operating system. | Virtualizes only the application and its dependencies. |
| Includes a complete guest OS. | Shares the host kernel. |
| Requires more CPU, memory, and storage. | Lightweight and resource-efficient. |
| Boots in minutes. | Starts in seconds or less. |
| Strong hardware-level isolation. | Process-level isolation. |

Docker containers are preferred in this project because they are lightweight, portable, and ideal for deploying independent services such as NGINX, WordPress, and MariaDB.

</details>

---

<details>
<summary><strong>Docker Secrets vs Environment Variables</strong></summary>

* Environment variables are commonly used to configure applications by providing values such as usernames, ports, or database names.

* Sensitive information like passwords should never be committed to a Git repository or exposed directly through environment variables.

* Docker Secrets provide a more secure approach by storing confidential data as protected files that are mounted into containers only when required.

| Environment Variables | Docker Secrets |
|-----------------------|----------------|
| Suitable for non-sensitive configuration. | Intended for confidential information. |
| Easily visible through container inspection. | Exposed only as protected files inside containers. |
| Convenient for general configuration. | Better suited for passwords and credentials. |

This project stores configuration values in a `.env` file while keeping passwords and sensitive credentials in Docker Secrets.

</details>

---

<details>
<summary><strong>Docker Bridge Network vs Host Network</strong></summary>

Docker provides multiple networking modes.

* A **Bridge Network** creates an isolated virtual network where containers communicate using their service names. Only explicitly published ports are accessible from outside the Docker network.

* A **Host Network** removes network isolation entirely by allowing containers to share the host's networking stack.

| Bridge Network | Host Network |
|----------------|--------------|
| Isolated from the host network. | Shares the host network directly. |
| Containers communicate through Docker DNS. | No network isolation. |
| Only selected ports are exposed. | All services share the host interfaces. |
| Recommended for multi-container applications. | Less secure and forbidden for this project. |

This project uses a custom bridge network so that only NGINX is publicly accessible while WordPress and MariaDB remain private.

</details>

---

<details>
<summary><strong>Docker Volumes vs Bind Mounts</strong></summary>

* Containers are ephemeral, meaning their data disappears when the container is removed unless persistent storage is configured.

* Docker Volumes are managed by Docker and are the recommended solution for persistent application data.

* Bind Mounts directly map an existing host directory into a container.

| Docker Volumes | Bind Mounts |
|----------------|-------------|
| Managed by Docker. | Managed directly by the host filesystem. |
| Portable and independent of host structure. | Depends on a specific host directory. |
| Recommended for persistent application data. | Primarily useful during development. |
| Easier to back up and migrate. | Tightly coupled to the host machine. |

The WordPress files and MariaDB database are stored using **named Docker volumes**, ensuring that data persists even when containers are recreated.

</details>
