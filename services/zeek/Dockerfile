# Use the zeekurity/zeek base image with version 5.0.10
FROM zeekurity/zeek:5.0.10

# Update package repositories and install required packages
RUN apt-get update && apt-get install -y \
    tini \
    gosu \
    libcap2-bin

# Install Zeek packages: ja3 and hassh
WORKDIR /usr/local/zeek
RUN ./bin/zkg install --force ja3 hassh ncsa/bro-simple-scan

# Create a group and Zeek user with specific UID and GID
RUN groupadd -g 1000 zeek && \
    useradd -u 1000 -g 1000 -d /usr/local/zeek -M -s /usr/sbin/nologin --no-create-home zeek

# Create a volume for Zeek logs
VOLUME /var/log/zeek

# Set the ownership of the Zeek installation directory to the 'zeek' user
RUN chown -R zeek:zeek /usr/local/zeek

# Copy the entrypoint script to /usr/local/sbin
COPY ./zeek/entrypoint.sh /usr/local/sbin/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /usr/local/sbin/entrypoint.sh

# Set the entrypoint command to run the entrypoint script with tini
ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/sbin/entrypoint.sh"]

# Set the default working directory
WORKDIR /usr/local/zeek
