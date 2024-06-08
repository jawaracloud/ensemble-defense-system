# Use the latest version of Filebeat image from the official Elastic repository
FROM docker.elastic.co/beats/filebeat:7.17.21

# Switch to the root user temporarily to install 'jq'
USER root

# Update the package repositories and install 'jq'
RUN apt-get update && apt-get install -y jq

# Create a directory for a custom script and change ownership to 'filebeat' user
RUN mkdir script && chown filebeat:filebeat script

# Switch back to the 'filebeat' user
USER filebeat

# Copy the custom entrywait script and set the appropriate permissions
COPY --chown=filebeat:filebeat ./filebeat/entrywait.sh script/entrywait.sh
RUN chmod +x script/entrywait.sh

# Set the custom entrypoint for the container
ENTRYPOINT ["script/entrywait.sh", "/bin/tini", "--", "/usr/share/filebeat/filebeat"]
