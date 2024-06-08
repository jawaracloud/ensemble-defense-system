FROM docker.elastic.co/beats/filebeat:7.17.21

# Set build argument for the directory

# Copy the filebeat.yml file to the conf.d directory
COPY filebeat.yml /usr/share/filebeat/filebeat.yml
COPY modules.d/ /usr/share/filebeat/modules.d/

# Debug step: List files to ensure the correct paths
RUN ls -l /usr/share/filebeat/

# Set the ownership and permissions of the filebeat.yml file
RUN chown root:root /usr/share/filebeat/filebeat.yml
RUN chown -R root:root /usr/share/filebeat/modules.d/

# Set the ownership and permissions of the modules.d directory
RUN chmod go-w /usr/share/filebeat/filebeat.yml
RUN chmod -R go-w /usr/share/filebeat/modules.d/
