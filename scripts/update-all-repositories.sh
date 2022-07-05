#!/bin/bash

current_dir="$(dirname "${BASH_SOURCE[0]}")"
. "${current_dir}/common.sh"

"${current_dir}/package-changed.sh"
"${current_dir}/index-all-repositories.sh"
