---
title: Qbs 2.2 released
date: '2023-12-16'
author: Christian Kandeler
---

The [Qbs build tool](http://qbs.io) version 2.2 is available.

## What's new

As already [hinted](https://qbs.io/blog/release-2.1.0/) at last time, the main
feature in this release is the parallelization of the project resolving phase.

<!--more-->

### Employing multiple cores for project resolving
Of course, any build tool compiles the sources you give to it on all the CPUs it can get its hands
on, possibly even on remote machines. However, the initial process of translating the on-disk
project description into a build graph usually does not lend itself to parallelization as easily.
Still, as this step can take a non-trivial amount of time for larger projects, it seemed at least
worth a try to parallelize it as well.

Our approach was to set up each product (i.e. application, library etc) in a dedicated thread, and
we are quite happy with the results, as for larger projects we are seeing an overall speed-up by
a factor of two to three across all host platforms. Combined with the considerable speed-up already
achieved in the previous version, project resolving is finally no longer a bottleneck when editing
project files in IDEs like Qt Creator.

### Other noteworthy changes
* Probe execution on macOS has become significantly faster.
* Modules can now contain Parameters items.
* ModuleProviders can now contain PropertyOptions items.
* The on-demand creation of Qt modules now happens only for those modules that the project actually
  requests.

## What's next
Having finished our performance improvement endeavor, we are now looking into tooling: If you feel
that IDEs such as  Qt Creator do not offer enough convenience functionality for Qbs project files –
say, in the area of code navigation or auto-completion – then you are not alone. We have some ideas
regarding this issue and are currently looking into employing the Language Server Protocol for a
client-independent solution.

## Try it

Qbs is available for download on the
[download page](https://download.qt.io/official_releases/qbs/2.2.1/).

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

Qbs 2.2.1 is also included in Qt Creator 12.0.1.

### Contribute
If You are a happy user of Qbs, please tell others about it. But maybe you would
like to contribute something. Everything that makes Qbs better is highly
appreciated. Contributions may consist of reporting bugs or fixing them right
away. But also new features are very welcome. Your patches will be automatically
sanity-checked, built and verified on Linux, macOS and Windows by our CI bot.
Get started with instructions in the [Qbs Wiki](https://wiki.qt.io/Qbs).

Thanks to everybody who made the 2.2 release happen:

* Christian Kandeler
* Dmitrii Meshkov
* Ivan Komissarov
* Nick Karg
* Serhii Olendarenko
* Thiemo van Engelen
* Thorbjørn Lindeijer
