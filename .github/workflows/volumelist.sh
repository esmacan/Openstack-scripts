#!/bin/bash

# Function to fetch volume details and print in columns
function fetch_volume_details() {
  # Array of volume properties
  properties=("ID" "Name" "Size")

  # Print column headers
  printf "%-40s %-40s %-10s\n" "${properties[@]}"

  # Loop to fetch and print volume details
  for volume_id in $(openstack volume list -c ID -f value); do
    volume_name=$(openstack volume show "$volume_id" -c name -f value)
    volume_size=$(openstack volume show "$volume_id" -c size -f value)
    printf "%-40s %-40s %-10s\n" "$volume_id" "$volume_name" "$volume_size"
  done
}

# Fetch and print volume details
fetch_volume_details
