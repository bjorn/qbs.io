---
title: Qbs 2.3.1 released
date: '2024-05-07'
author: Ivan Komissarov
---

The [Qbs build tool](http://qbs.io) version 2.3.1 is available.

## What's new

<!--more-->

This is a minor bugfix release that contains some fixes such as:

* Fixed look-up of qbs properties in module providers via probes
  ([QBS-1742](https://bugreports.qt.io/projects/QBS/issues/QBS-1742)).
* Fixed codesign module when multiplexing over build variants
  ([QBS-1775](https://bugreports.qt.io/projects/QBS/issues/QBS-1775)).
* Fixed retrieving minimum macOS/iOS versions for Qt 6.7.1 version and above.

Sources, binaries, change log etc can be found
[here](https://download.qt.io/official_releases/qbs/2.3.1/).

This release of qbs is also part of Qt Creator 13.0.1.

Also, Qbs binaries are available via different package managers such as
[Chocolatey](https://community.chocolatey.org/packages/qbs),
[Brew](https://formulae.brew.sh/formula/qbs), [macports](https://ports.macports.org/port/qbs/) and
[others](https://repology.org/metapackage/qbs/versions).

### Contributors
Thanks to everybody who made the 2.3.1 release happen:

* Christian Kandeler
* Ivan Komissarov
