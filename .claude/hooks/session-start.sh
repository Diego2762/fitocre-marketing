#!/bin/bash
# Instala la CLI de Higgsfield en sesiones en la nube si falta.
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

if ! command -v higgsfield >/dev/null 2>&1; then
  npm i -g @higgsfield/cli >/dev/null 2>&1
fi
