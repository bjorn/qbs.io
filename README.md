<!--
SPDX-FileCopyrightText: 2023 Janet Blackquill <uhhadd@gmail.com>

SPDX-License-Identifier: CC0-1.0
-->

# qbs.io

## Preparing the build

qbs.io is built with Hugo; refer to [Hugo docs](https://gohugo.io/getting-started/usage/) for how to build it.
Before building with Hugo, do the following:

- run `yarn` in the repo root to install the node packages
- initialize submodules to check out Qbs docs (`git submodule update --init`)
- make sure qmake and qdoc are in PATH
- run `./_generate.sh` from the scripts subdirectory to compile qbs qdocs and process them for hugo


## Building locally

### macOS
- First, you'd need to setup a local web server as described
  [here](https://discussions.apple.com/docs/DOC-3083).
- Second, create a symlink in ~/Sites pointing to the `public/` folder in this repo, e.g.:
  `ls -s ~/Sites/qbs-io ~/Developer/qbs-io/public`.
- Ensure qmake and qdoc are in PATH: `export PATH=/Applications/Qt/6.7.0/macos/bin/:$PATH`.
- Run `./_generate.sh` to rebuild docs.
- Run `hugo -b http://localhost/~${USER}/qbs-io`.
- Run `open http://localhost/~${USER}/qbs-io/`.