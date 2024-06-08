#!/bin/bash

# Function to create the Zeek log directory if it doesn't exist
create_zeek_log_dir() {
    local log_dir="/var/log/zeek/current"
    if [ ! -d "$log_dir" ]; then
        mkdir -p "$log_dir"
    fi
}

# Function to set Zeek group ID if needed
set_zeek_group_id() {
    local desired_pgid="$1"
    local current_pgid="$(id -g zeek)"
    if [ "$desired_pgid" -ne "$current_pgid" ]; then
        echo "Configuring the Zeek group ID to match $desired_pgid"
        groupmod -o -g "$desired_pgid" zeek
    fi
}

# Function to set Zeek user ID if needed
set_zeek_user_id() {
    local desired_puid="$1"
    local current_puid="$(id -u zeek)"
    if [ "$desired_puid" -ne "$current_puid" ]; then
        echo "Configuring the Zeek user ID to match $desired_puid"
        usermod -o -u "$desired_puid" zeek
    fi
}

# Function to set ownership of Zeek log directories
set_zeek_log_ownership() {
    chown -R zeek:zeek /var/log/zeek
}

# Function to set capabilities for Zeek and capstats
set_capabilities() {
    setcap cap_net_raw,cap_net_admin=eip /usr/local/zeek/bin/zeek
    setcap cap_net_raw,cap_net_admin=eip /usr/local/zeek/bin/capstats
}

create_zeek_log_dir
set_zeek_group_id "$PGID"
set_zeek_user_id "$PUID"
set_zeek_log_ownership
set_capabilities

# Run Zeek as the 'zeek' user
exec gosu zeek:zeek /usr/local/zeek/bin/zeek -C local "$@"
