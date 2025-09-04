#!/usr/bin/env bash
set -euxo pipefail

echo "Waiting for the Ollama service to start..."
# This loop waits until the Ollama container is ready to accept requests
for i in $(seq 1 120); do
  if curl -fsS http://ollama:11434/api/tags >/dev/null 2>&1; then
    echo "Ollama is ready!"
    break
  fi
  sleep 1
done

echo "Pulling LLM models in the background. Your terminal is ready to use."
# This pulls the models without blocking you from working
(
  for model in mistral llama3 gemma:2b; do
    ollama pull "$model"
  done
  echo "All models finished pulling."
) &