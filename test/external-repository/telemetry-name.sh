#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Definition specific tests

check "git-config" grep "ado-auth-helper" <(cat /tmp/telemetry-name/.git/config)

cd /tmp/telemetry-name
export CODESPACE_NAME="commit.hooks-testing"
echo "Make changes to README.md" >> README.md
git add README.md
git commit -m "Change the README.md file"

check "hook" grep "(Codespaces)" <(git log -1)

# Report result
reportResults