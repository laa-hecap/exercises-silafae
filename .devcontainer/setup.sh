#!/usr/bin/env bash
set -euxo pipefail

# Install basic tools
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  python3-pip git-lfs jq make g++ curl \
  && rm -rf /var/lib/apt/lists/*

git lfs install

# Install Python libraries for your exercises
python3 -m pip install --no-cache-dir numpy matplotlib uproot ollama requests
