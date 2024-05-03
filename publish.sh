#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2022 Carson Black <uhhadd@gmail.com>
#
# SPDX-License-Identifier: MIT

set -euxo pipefail

export NODE_ENV=production

if [ "`git status -s`" ]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

echo "Ensuring remote exists..."
git remote show site || git remote add site git@github.com:qbs/qbs.github.io.git

echo "Fetching latest current site"
git fetch site

echo "Deleting old public dir"
rm -rf public
mkdir public
git worktree prune
rm -rf .git/worktrees/public/

echo "Checking out gh-pages branch into public"
git worktree add -B gh-pages public site/gh-pages

echo "Removing existing files"
rm -rf public/*

echo "Generating site"
hugo --baseURL https://qbs.io

echo "Updating gh-pages branch"
cd public && git add --all && git commit -m "Publishing to gh-pages (publish.sh)"

echo "Pushing to github"
git push site gh-pages
