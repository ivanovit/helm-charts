#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

charts_dir="charts"
dist_dir="docs"

log(){
  echo "[$(date)] $@"
}
