#!/bin/bash
run_cmd() {
  cmd=$1
  opts=$2
  eval "$cmd $opts"
}
run_cmd "$1" "$2"

