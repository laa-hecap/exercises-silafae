#!/usr/bin/env bash
set -euxo pipefail

echo "Waiting for Ollama service to be ready..."
# Wait for the Ollama sidecar to be ready before proceeding
for i in $(seq 1 120); do
  if curl -fsS http://ollama:11434/api/tags >/dev/null 2>&1; then
    echo "Ollama is up!"
    break
  fi
  sleep 1
done

echo "Pulling LLM models in the background..."
# Pull models without blocking the terminal
(
  ollama pull llama3
  ollama pull mistral
  echo "Model pulling complete."
) &
