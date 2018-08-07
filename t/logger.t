#!/bin/bash

. ./logger

echo 1..1

diff <({
  log_error error
  log_warn warn
  log_info info
  log_debug debug
  log_trace trace
} 2>&1) ./t/logger.t.snapshot &> /dev/null \
  && echo ok \
  || echo not ok
