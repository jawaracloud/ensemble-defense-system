# Use the zeekurity/zeek base image with version 5.0.10
FROM zeek/zeek:6.0

# Update package repositories and install required packages
RUN apt-get update && apt-get install -y \
    tini \
    gosu \
    libcap2-bin

# Install Zeek packages: ja3 and hassh
WORKDIR /usr/local/zeek
RUN ./bin/zkg install --force ja3 hassh

# Create a group and Zeek user with specific UID and GID
RUN groupadd -g 1000 zeek && \
    useradd -u 1000 -g 1000 -d /usr/local/zeek -M -s /usr/sbin/nologin --no-create-home zeek

# Create a volume for Zeek logs
VOLUME /var/log/zeek

# Set the ownership of the Zeek installation directory to the 'zeek' user
RUN chown -R zeek:zeek /usr/local/zeek
RUN ln -s /usr/local/zeek/*.log /var/log/zeek
