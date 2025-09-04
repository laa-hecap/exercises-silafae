#!/usr/bin/env bash
set -euxo pipefail

# Install system tools needed for your scripts and for communicating with Ollama
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  python3-pip git-lfs jq make g++ curl \
  && rm -rf /var/lib/apt/lists/*

git lfs install

# Install Python libraries for ROOT analysis and the Ollama client
python3 -m pip install --no-cache-dir numpy matplotlib uproot ollama requests