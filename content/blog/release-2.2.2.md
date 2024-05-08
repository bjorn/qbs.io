---
title: Qbs 2.2.2 released
date: '2024-02-07'
author: Ivan Komissarov
---

The [Qbs build tool](http://qbs.io) version 2.2.2 is available.

## What's new

<!--more-->

This is a minor bugfix release that contains some fixes such as:

* Fixed name collision check for multi-part modules
  ([QBS-1772](https://bugreports.qt.io/projects/QBS/issues/QBS-1772)).
* Fixed potential assertion when attaching properties on non-present modules
  ([QBS-1776](https://bugreports.qt.io/projects/QBS/issues/QBS-1776)).
* Fixed handling assember flags with MSVC (QBS-1774).
* Fixed the qbspkgconfig Qt provider for the case when there is no Qt
  ([QBS-1777](https://bugreports.qt.io/projects/QBS/issues/QBS-1777)).
* Make protobuf usable without qbspkgconfig again
  ([QBS-1663](https://bugreports.qt.io/projects/QBS/issues/QBS-1663)).
* Added support for the 'definePrefix' option to qbspkgconfig.

Sources, binaries, change log etc can be found
[here](https://download.qt.io/official_releases/qbs/2.2.2/).

This release of qbs is also part of Qt Creator 12.0.2.

Also, Qbs binaries are available via different package managers such as
[Chocolatey](https://community.chocolatey.org/packages/qbs),
[Brew](https://formulae.brew.sh/formula/qbs), [macports](https://ports.macports.org/port/qbs/) and
[others](https://repology.org/metapackage/qbs/versions).

### Contributors
Thanks to everybody who made the 2.2.2 release happen:

* Björn Schäpers
* Christian Kandeler
* Ivan Komissarov
