#!/usr/bin/env bash
set -euo pipefail

uv tool install ansible-dev-tools --with adt,jmespath,argcomplete,passlib --with-executables-from ade,ansible,ansible-builder,ansible-lint,ansible-navigator,ansible-runner,ansible-sign,molecule,ansible-core,ansible-dev-environment
