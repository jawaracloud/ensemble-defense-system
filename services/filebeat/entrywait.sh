#!/bin/bash

# Initialize attempt counter and set the maximum number of attempts
attempt_counter=0
max_attempts=30

# Ensure correct permissions on the Filebeat configuration files
chmod go-w /usr/share/filebeat/filebeat.yml
chmod -R go-w /usr/share/filebeat/modules.d

# Run the main container command specified as arguments
exec "$@"
