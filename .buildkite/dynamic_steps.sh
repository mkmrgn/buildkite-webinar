#!/bin/bash

set -e

loops=$(buildkite-agent meta-data get loops)

echo "  - group: ':curly_loop: group step'"
echo "    key: groupstep"
echo "    steps:"
for((i=0;i<loops;i++));
do
  cat <<YAML
            - label: "$i"
              command: echo "Dynamic step $i"
              agents:
                queue: "aws"
YAML
done
