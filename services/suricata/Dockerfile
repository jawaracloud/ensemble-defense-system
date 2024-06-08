# Use the latest Suricata container image from jasonish/suricata
FROM jasonish/suricata:latest

# Copy the initialization script (init.sh) into the image
COPY --chown=root:root ./suricata/init.sh /init.sh

# Make the initialization script executable
RUN chmod +x /init.sh

# Set the initialization script as the entry point for the container
ENTRYPOINT ["/init.sh"]
