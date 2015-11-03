#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

pip install bcrypt > /dev/null 2>&1 || true
python -c "import bcrypt; import getpass; print bcrypt.hashpw(getpass.getpass(), bcrypt.gensalt(prefix=b'2a'))" 2> /dev/null

