#!/usr/bin/env bash
set -e 

# TODO: Replace with `main`
BASELINE_BRANCH=${BASELINE_BRANCH:="edu/reassure_poc"}

# Required for `git switch` on CI
git fetch origin

# Gather baseline perf measurements
git switch "$BASELINE_BRANCH"

yarn install --force
yarn reassure --baseline

# Gather current perf measurements & compare results
git switch --detach -

yarn install --force
yarn reassure --branch
