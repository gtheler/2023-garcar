#!/bin/bash -e

if [ -d .git ]; then
  hash=$(git rev-parse --short HEAD)
  headepoch=$(git log -1 --format="%ct")
  date="${hash}---$(LC_ALL=${DATELC} date -d@${headepoch} +%Y-%m-%d)"
  if [ ! -z "$(git status --porcelain)" ]; then
    date="${date}+"
  fi
else
  date=$(date +%Y-%m-%d)
fi

cat << EOF > hash.yaml
---
date: ${date}
...
EOF
