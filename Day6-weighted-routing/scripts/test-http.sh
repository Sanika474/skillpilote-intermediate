#!/usr/bin/env bash
set -euo pipefail
if [[ $# -ne 1 ]]; then echo "Usage: $0 <https://hostname>"; exit 1; fi
echo "HTTP headers:"; curl -sSIL --max-time 20 "$1"
echo; echo "Page content:"; curl -sSL --max-time 20 "$1" | head -n 30
