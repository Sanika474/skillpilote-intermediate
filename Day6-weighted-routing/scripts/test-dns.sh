#!/usr/bin/env bash
set -euo pipefail
if [[ $# -ne 1 ]]; then echo "Usage: $0 <hostname>"; exit 1; fi
for i in {1..10}; do printf "%02d: " "$i"; dig +short "$1" | paste -sd ' ' -; sleep 1; done
