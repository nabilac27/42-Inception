# MariaDB

# ✓ MariaDB image builds from Debian
# ✓ Container stays running
# ✓ No official MariaDB image is used
# ✓ WordPress database exists
# ✓ Non-root database user exists
# ✓ MariaDB listens on the Docker network
# ✓ Database survives container recreation
# ✓ mariadbd runs as the main foreground process

# Initial version:
# - Build from Debian 12
# - Install MariaDB Server
# - Start mariadbd in the foreground

FROM debian:12

RUN apt-get update && \
	apt-get install -y --no-install-recommends mariadb-server && \
	rm -rf /var/lib/apt/lists/* && \
	mkdir -p /run/mysqld && \
	chown mysql:mysql /run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/init.sh /usr/local/bin/init.sh

RUN chmod +x /usr/local/bin/init.sh

USER mysql

ENTRYPOINT ["/usr/local/bin/init.sh"]

# Docker container
#       │
#       ├── root        ❌ don't run MariaDB as this
#       │
#       └── mysql       ✅
#            │
#            └── mariadbd