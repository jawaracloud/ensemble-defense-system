FROM docker.elastic.co/beats/filebeat:7.17.21

# Copy the filebeat.yml file to the conf.d directory
COPY filebeat.yml /usr/share/filebeat/filebeat.yml
COPY modules.d/* /usr/share/filebeat/modules.d/

# Set the ownership and permissions of the filebeat.yml file
RUN sudo chown root:root /usr/share/filebeat/filebeat.yml
RUN sudo chown -R root:root /usr/share/filebeat/modules.d/

# Set the ownership and permissions of the modules.d directory
RUN sudo chmod go-w /usr/share/filebeat/filebeat.yml
RUN sudo chmod -R go-w /usr/share/filebeat/modules.d/
