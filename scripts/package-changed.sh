#!/bin/bash

. $(dirname "${BASH_SOURCE[0]}")/common.sh

log "Fetching latest tags from github"
git fetch --tags

latest_release_sha="$(git describe --tags --abbrev=0)"

log "Latest tag is ${latest_release_sha}"

changed_charts=$(for change in $(git diff $(git describe --tags --abbrev=0)..HEAD --name-only 2>/dev/null | grep 'charts/'); do \
  [[ "$change" =~ ^charts/([^/]+/[^/]+) ]] && echo "${BASH_REMATCH[1]}"; done | sort | uniq)

for chart in $changed_charts; do
  log "Packaging chart ${chart}"

  dist_chart_dir="${dist_dir}/${chart}"
  mkdir -p "${dist_chart_dir}"

  helm package "${charts_dir}/${chart}" -d "${dist_chart_dir}"
done
