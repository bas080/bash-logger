#!/usr/bin/env bash

source ./bash-logger

# Write to file
LOGGER_FILE="/tmp/bash-logger.tmp"

rm "$LOGGER_FILE"

# Overwrite so the date is constant
logger_date() {
  echo '<date>'
}


{
  log_error error
  log_warn warn
  log_info info
  log_debug debug
  log_trace trace
} 2>&1

cat "$LOGGER_FILE"
