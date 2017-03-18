#!/usr/bin/env bash

set -e

script_dir="$(cd "$(dirname "$0")"; pwd)"

envsubst < "${script_dir}/pypirc.tmpl" > ~/.pypirc

git clean -fd
git reset --hard "${TRAVIS_COMMIT}"
git checkout "${TRAVIS_COMMIT}"

git status
ls -al
git remote -v

bumpversion --no-input --feature
release --no-input