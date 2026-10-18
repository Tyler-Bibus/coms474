#!/usr/bin/env bash
# Run from any directory: bash /path/to/coms474/setup_venv.sh
# Select an interpreter if needed: PYTHON=python3.12 bash setup_venv.sh
set -euo pipefail

PROJECT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="$PROJECT_DIR/.venv"
PYTHON="${PYTHON:-python3}"

"$PYTHON" -m venv "$VENV_DIR"
"$VENV_DIR/bin/python" -m pip install --upgrade pip
"$VENV_DIR/bin/python" -m pip install -r "$PROJECT_DIR/requirements.txt"
"$VENV_DIR/bin/python" -m ipykernel install \
    --sys-prefix \
    --name coms474 \
    --display-name "Python (coms474)"

printf '\nSetup complete. From the project directory, run:\n'
printf '  source .venv/bin/activate\n'
printf '  jupyter lab src/project.ipynb\n'
printf '\nSelect the Python (coms474) kernel.\n'
