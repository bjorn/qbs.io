---
title: Qbs 2.3.0 released
date: '2024-04-08'
author: Ivan Komissarov
---

The [Qbs build tool](http://qbs.io) version 2.3.0 is available.

## What's new

As [hinted](https://qbs.io/blog/release-2.2.1/) at last time, the main
feature in this release is the use of the new Language Protocol Server for "go to definition" in
certain contexts and auto-completion.

<!--more-->

### Language Protocol Server

We have added a Language Protocol Server to Qbs which provides IDE-agnostic tooling
(https://microsoft.github.io/language-server-protocol). On top of it, we added the "go to
definition" feature to QtCreator - it is now possible to open source files from *.qbs files by
simply pressing F2. We have also added support for autocompletion of the module properties:

![autocompletion](../../img/blog/release-2.3.0.image.1.png)

### General
We have added a possibility to export products to CMake via the new Exporter.cmake module. This
allows to use libraries built with Qbs directly with CMake projects without the need to use an
intermediate representation in form of the Exporter.pkgconfig.

We deprecated the "fallback" module
[provider](https://doc.qt.io/qbs/module-providers.html#how-qbs-uses-module-providers) in favor of
the [qbspkgconfig](https://doc.qt.io/qbs/qml-qbsmoduleproviders-qbspkgconfig.html) provider.
In Qbs, module providers generate missing modules during the project configuration ("resolve")
stage. Historically, we had only Qt and "fallback" module providers and there was no way to control
which providers are run until we introduced "named" module providers in
[Qbs 1.21](https://qbs.io/blog/release-1.21/). At the same time, we've added the
`qbspkgconfig` provider that reads .pc files directly, avoiding expensive invocations of the
`pkg-config` tool. Since then, we had two almost identical providers that work on top of .pc files.
However, the problem with the "fallback" provider is that it works differently from other
providers as well as suffers performance issues and has the same bugs as the `pkg-config` tool.
Thus, we decided to deprecate the "fallback" provider in Qbs 2.3.0 and remove it in Qbs 2.4.0.
For details on how to use the `qbspkgconfig` provider, see the
[provider page](https://qbs.io//docs/qml-qbsmoduleproviders-qbspkgconfig/) in the documentation.
Also, please report any bugs in the `qbspkgconfig` to the
[bug tracker](https://bugreports.qt.io/browse/QBS/).

We have added a new [Tutorial](https://qbs.io//docs/tutorial/) section in the documentaion to make
it easier to grasp core concepts and make users familiar with best practices. Also, we added a
new [example](https://github.com/qbs/qbs/blob/master/examples/exporters/qbs/imports/MyLibrary.qbs)
on how to use Exporter modules.

If a project needs to be re-resolved, we now print the reason. Also, we rewrote the wildards
handling to track changes more accurately.

### C/C++ Support
We fixed an issue with complex project structure that lead to a non-linear algorithm during
traversing of the dependencies. Now, private dependencies (dependencies of static libraries) of
products are not traversed more than once anymore
([QBS-1714](https://bugreports.qt.io/browse/QBS-1714)).

### Language
* Module properties are now accessible for groups in modules
  ([QBS-1770](https://bugreports.qt.io/browse/QBS-1770)).
* The qbspkgconfig.mergeDependencies property was removed. This feature only existed because of
  performance limitations which were fixed in [Qbs 2.1.0](https://qbs.io/blog/release-2.1.0/).
* ModuleProviders now support the
  [allowedValues](https://qbs.io//docs/qml-qbslanguageitems-propertyoptions/#allowedValues-prop)
  property of the PropertyOptions item ([QBS-1748](https://bugreports.qt.io/browse/QBS-1748)).

## Try it

Qbs is available for download on the
[download page](https://download.qt.io/official_releases/qbs/2.3.0/).

Please report issues in our [bug tracker](https://bugreports.qt.io/browse/QBS/).

Join our [Discord server](https://discord.gg/zhMHvC5GNa) for live discussions.

You can use our [mailing list](https://lists.qt-project.org/mailman/listinfo/qbs) for questions
and discussions.

The [documentation](https://qbs.io/docs/index.html)
and [wiki](https://wiki.qt.io/Qbs) are also good places to get started.

Qbs is also available from a number of package repositories
([Chocolatey](https://chocolatey.org/packages/qbs),
[MacPorts](https://www.macports.org/ports.php?by=name&substr=qbs),
[Homebrew](https://formulae.brew.sh/formula/qbs)) and is updated on each
release by the Qbs development team. It can also be installed through
the native package management system on a number of Linux distributions.
Please find a complete overview on
[repology.org](https://repology.org/project/qbs/versions).

Qbs 2.3.0 is also included in Qt Creator 13.0.0.

### Contribute
If You are a happy user of Qbs, please tell others about it. But maybe you would
like to contribute something. Everything that makes Qbs better is highly
appreciated. Contributions may consist of reporting bugs or fixing them right
away. But also new features are very welcome. Your patches will be automatically
sanity-checked, built and verified on Linux, macOS and Windows by our CI bot.
Get started with instructions in the [Qbs Wiki](https://wiki.qt.io/Qbs).

Thanks to everybody who made the 2.3 release happen:

* Christian Kandeler
* Dmitrii Meshkov
* Ivan Komissarov
* Raphael Cotty
* Richard Weickelt
