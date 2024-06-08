# Use the zeekurity/zeek base image with version 5.0.10
FROM zeekurity/zeek:5.0.10

# Install Zeek packages: ja3 and hassh
WORKDIR /usr/local/zeek/bin
RUN ./zkg install --force ja3 hassh

# Update package repositories and install required packages
RUN apt-get update && apt-get install -y tini gosu libcap2-bin

# Create a Zeek group and user with specific UID and GID
RUN adduser -u 1000 -g 1000 -d /usr/local/zeek -M -s /sbin/nologin --disabled-password zeek

# Create a volume for Zeek logs
VOLUME "/var/log/zeek"

# Set the ownership of the Zeek installation directory to the 'zeek' user
WORKDIR /usr/local
RUN chown -R zeek:zeek ./zeek

# Copy the entrypoint script to /usr/local/sbin
COPY ./zeek/entrypoint.sh /usr/local/sbin/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /usr/local/sbin/entrypoint.sh

# Set the entrypoint command to run the entrypoint script with tini
ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/sbin/entrypoint.sh"]
