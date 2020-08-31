Dots
====

This repo contains my standard set of dot files for use on any system.

Prerequisites
-------------

### Ubuntu

Install Vim:

    $ sudo apt install vim-gtk3

There used to be various confusingly similar `vim` packages for Ubuntu - now `vim-gtk3` seems more clearly to be the right one to choose.

### Mac

The Mac setup depends on a number of brew formulae:

    $ brew install bash-completion grep coreutils gnu-sed

For MacVim, see [`mac-vim.md`](mac-vim.md).

Installation
------------

To install:

    $ cd
    $ git clone git@github.com:george-hawkins/dots.git .dots
    $ cd .dots
    $ ./install

Any existing dot files, that are replaced by this process, are moved to `~/.dots/bak`.

Open a new terminal session now or you'll get errors related to `VIM_TERMINAL_BG` (defined in `.bashrc`) when editing files.

If you're on a work machine and have `~/.ssh-personal` you can set `git` to use this like so:

    $ export GIT_SSH_COMMAND="ssh -i $HOME/.ssh-personal/id_rsa -o IdentitiesOnly=yes"

Next steps
----------

* Modify `.gitconfig` to change your `email` address if necessary.
* In `.bashrc` decide whether to use `light` or `dark` for `VIM_TERMINAL_BG`.

Add any system specific settings into `.bashrc` (or copy them from an existing similar system, e.g. your previous work machine).

**Note:** if you ever start using your Linux work desktop again then make sure to copy over the `MACHINE_IP` entry from your work Mac `~/.bashrc`.

Ssh
---

Copy over `.ssh` from an existing system.

    .ssh/NOTES.txt
    .ssh/authorized_keys
    .ssh/id_rsa
    .ssh/id_rsa.pub
    .ssh/known_hosts

The `NOTES.txt` file just specifies the identity that the key pair is associated with.

Keyboard layout
---------------

On Ubuntu, first get compose working. There are various solutions to entering e.g. unlauts (dead keys etc.), using compose is the least intrusive (dead key impact entering common coding related characters).

    $ sudo apt install gnome-tweaks

Then start the _Tweaks_ UI, go to _Keyboard & Mouse_, click the _Disabled_ toggle for _Compose Key_, click the toggle in the title bar of the resulting dialog and select _Right Alt_.

Then you can enter e.g. &euml; with `RightAlt-"` followed by `e`.

Note: initially, I had my keyboard set to "English (US, euro on 5)" but this uses _Right Alt_ for its own purposes.

Now, get tilde-backtick set up as per [`key-layout.md`](key-layout.md).

Java etc.
---------

Use `sdkman` to install Java etc. on both Linux and Mac. First install `sdkman` as per the [instructions](https://sdkman.io/install) for installing _without_ automatically modifying your rc files:

    $ curl -s "https://get.sdkman.io?rcupdate=false" | bash

Then add the `source` line that it specifies to _the end_ of your `.bashrc`.

Note: originally, I let it just add this `source` line itself but, for whatever reason, it modifies `.bashrc` on Ubuntu and `.bash_profile` on Mac. Doing this on Mac knocks out the `install` script's decision to favor `.profile` over `.bash_profile` (and you'll notice that `.bashrc` no read when you open a new terminal session as the `.bash_profile` created by `sdkman` isn't set up to `source` it). See _Notes_ below for more.

To install Java:

    $ sdk install java

This will install the latest LTS version found at [AdoptOpenJDK](https://adoptopenjdk.net/) and will set `JAVA_HOME` (though you have to open a new terminal session for this to become visible).

Then install Kotlin (if you want the `kotlinc` REPL to be available) and Maven:

    $ sdk install maven
    $ sdk install kotlin

Python
------

On Mac, install `pyenv` as per its [Homebrew instructions](https://github.com/pyenv/pyenv#homebrew-on-macos) (Mac has a complicated dependency situation which makes it troublesome to install via the `curl` approach).

On Linux, install the prerequisites as per the [wiki entry](https://github.com/pyenv/pyenv/wiki/Common-build-problems#prerequisites) and then install using [`pyenv-installer`](https://github.com/pyenv/pyenv-installer#install).

Remember to copy in the relevant entries that the installation process prompts you to include in your `~/.bashrc`. If you install `pyenv` with brew, you need to ask it what the relevant lines are:

    $ pyenv init

Find the latest known standard Python version:

    $ latest=$(pyenv install --list | egrep '^[ 0-9.]*$' | tail -1)

And install this and set it as the global version, like so:

    $ pyenv install $latest
    $ pyenv global $latest

For more, see my `pyenv` [notes](https://github.com/george-hawkins/snippets/blob/master/install-python.md#pyenv).

Node and Ruby (optional)
------------------------

To install Node (and `npm`), see my nvm related instructions [here](https://github.com/george-hawkins/snippets/blob/master/install-node-and-npm.md).

To install Ruby (and manage gems), see the `rbenv` [installation instructions](https://github.com/rbenv/rbenv#installation).

.gnupg, .pki and .netrc
-----------------------

In addition to `.ssh`, there are various key related directories on Ubuntu:

* `.gnupg` - this is set up even if you're not using GnuPG. By what, I don't know.
* `.pki` - this is used by Gnome Keyring.
* `.netrc` - if using Heroku, the Heroku related entries in `.netrc` are not created manually but as a result of running `heroku login`.

Notes
-----

The `install` script removes any existing `.bash_profile` file. There's no point having `.profile` and `.bash_profile` and, after a little research, I'm favoring `.profile` for fairly arbitrary reasons.
