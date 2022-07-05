#!/bin/bash

. $(dirname "${BASH_SOURCE[0]}")/common.sh

for repository in "$(ls ${dist_dir})"; do
  log "Indexing repository ${repository}."
  pushd "${dist_dir}/${repository}" > /dev/null

  helm repo index --merge index.yaml .

  log "Indexing repository ${repository} complete."
done
