#!/usr/bin/env bash

source bash-logger
source bash-tap
source bash-snapshot

# Overwrite so the date is constant
logger_date() {
  echo '<date>'
}

plan 1

snapshot <({
  log_error error
  log_warn warn
  log_info info
  log_debug debug
  log_trace trace
} 2>&1) ./t/bash-logger.t.snapshot
test_success "Log functions output correctly"
