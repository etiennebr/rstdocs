A brief tour of Monteverdi2
===========================

Introduction
------------

**Monteverdi** was developed 4 years ago in order to provide an
integrated application for capacity building activities (teaching,
simple image manipulation, etc.). Its success went far beyond this
initial scope since it opened the OTB world to a wide range of users who
needed a ready to use graphical tool more than a library of components
to write their own processing chain. With this 4 years of lifetime, we
have a lot of feedbacks regarding how useful the tool was, but also
regarding what should be improved to move toward greater usability and
operationnality. We therefore decided to rework the Monteverdi concept
into a brand new software, enlightened by this experience.

**Monteverdi2** offers a new interface based on Qt and a set of
processing capibilities base on OTB-Applications.

Installation
------------

Installation of **Monteverdi2** is very simple. Standard installer
packages are available on the main platforms thanks to OTB-Developpers
and external users. These packages are available few days after the
release. Get the latest information on binary packages on the in the
section download.

We will discribe in the following sections the way to install
**Monteverdi2** on:

-  Windows platform (XP/Seven/8.1)

-  Ubuntu 12.04 and higher

-  MacOSX 10.8

If you want build from source or if we don’t provide packages for your
system, some informations are available into the , in the section
**(**\ Building from Source)

Windows XP/Seven/8.1
~~~~~~~~~~~~~~~~~~~~

For Windows XP/Seven/8.1 users, there is a classical standalone
installation program for **Monteverdi2** , available from the after each
release of **Monteverdi2** .

MacOS X
~~~~~~~

A standard DMG package is available for **Monteverdi2** for MacOS X
10.8. Please go the . Click on the file to launch **Monteverdi2** . We
will provide in the next release a package for MacOSX 10.9.

Ubuntu 12.04 and higher
~~~~~~~~~~~~~~~~~~~~~~~

For Ubuntu 12.04 and higher, **Monteverdi2** package may be available as
Debian package through APT repositories.

Since release 0.2, **Monteverdi2** packages are available in the
`ubuntugis-unstable <https://launchpad.net/~ubuntugis/+archive/ubuntugis-unstable>`__
repository.

You can add it by using these command-lines:

::

    sudo aptitude install add-apt-repository
    sudo apt-add-repository ppa:ubuntugis/ubuntugis-unstable

Now run:

::

    sudo aptitude install monteverdi2

If you are using *Synaptic*, you can add the repository, update and
install the package through the graphical interface.

**apt-add-repository** will try to retrieve the GPG keys of the
repositories to certify the origin of the packages. If you are behind a
http proxy, this step won’t work and apt-add-repository will stall and
eventually quit. You can temporarily ignore this error and proceed with
the update step. Following this, aptitude update will issue a warning
about a signature problem. This warning won’t prevent you from
installing the packages.

What does it look like?
-----------------------

You can find more information about **Monteverdi2** into the post of the
OTB blog at http://blog.orfeo-toolbox.org/.
