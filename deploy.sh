#!/bin/bash

set -euxo pipefail

git config --global user.email "dan@getitdunnrun.com"
git config --global user.name "getitdunnbot"

pushd build
rm -rf .git
git init .
git remote add origin git@github.com:danielnaab/getitdunn.git
git checkout -b gh-pages
git add .
git commit -m "getitdunnbot automated build"
git push --force origin gh-pages
popd
