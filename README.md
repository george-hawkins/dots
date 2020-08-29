Dots
====

To install:

    $ cd
    $ git clone git@github.com:george-hawkins/dots.git .dots
    $ cd .dots
    $ ./install

Any existing dot files, that are replaced by this process, are moved to `~/.dots/bak`.

Open a new terminal session now or you'll get errors related to `VIM_TERMINAL_BG` (defined in `.bashrc`) when editing files.

Linux
-----

Install Vim:

    $ sudo apt install vim-gtk3

There used to be various confusingly similar `vim` packages for Ubuntu - now `vim-gtk3` seems more clearly to be the right one to choose.

Mac
---

The Mac setup depends on a number of brew formulae:

    $ brew install bash-completion grep coreutils gnu-sed

For MacVim, see the section down below.

Next steps
----------

* Modify `.gitconfig` to change your `email` address if necessary.
* In `.bashrc` decide whether to use `light` or `dark` for `VIM_TERMINAL_BG`.

Add any system specific settings into `.bashrc` (or copy them from an existing similar system, e.g. your previous work machine).

**TODO:** remove `.bashrc.local` once you've got your work systems set up.

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

**TODO:** get complicated tilde-backtick setup for Linux.

Java etc.
---------

Use `sdkman` to install Java etc. on both Linux and Mac. First install `sdkman` as per its [installation instructions](https://sdkman.io/install).

Note that `sdkman` automatically modifies your `.bashrc`.

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

Remember to copy in the relevant entries that the installation process prompts you to include in your `~/.bashrc`.

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

`.gnupg`, `.pki` and `.netrc`
-----------------------------

In addition to `.ssh`, there are various key related directories on Ubuntu:

* `.gnupg` - this is set up even if you're not using GnuPG. By what, I don't know.
* `.pki` - this is used by Gnome Keyring.
* `.netrc` - if using Heroku, the Heroku related entries in `.netrc` are not created manually but as a result of running `heroku login`.

Notes
-----

The `install` script removes any existing `.bash_profile` file. There's no point having `.profile` and `.bash_profile` and, after a little research, I'm favoring `.profile` for fairly arbitrary reasons.

MacVim
------

To install the standard version of Vim simply do:

    $ brew install vim

**TODO:** I'm assuming `brew cask install macvim` does not install the command-line version of Vim. Do the cask install first and double check.

`brew install` can no longer install the `.app` style applications that Spotlight, i.e. command-space, knows about. There used to be a `brew` command called `linkapps` that tried to deal with this but it has been deprecated due to the difficulties involved.

Now you've got a number of options:

* `brew install macvim` - install MacVim such that it can only be started from the command line.
* `brew cask install macvim` - install MacVim such that it can also be started via Spotlight.
* Download the MacVim project's latest release [here](https://macvim-dev.github.io/macvim/) and create a soft link as per this FAQ [entry](https://github.com/macvim-dev/macvim/wiki/FAQ#how-can-i-open-files-from-terminal).

Note: the MacVim project uses the term "SnapShot" for its releases, don't be put off by this. These "SnapShot" releases are valid stable releases and are what are tracked by the `brew install` formula.

So why isn't the `cask install` the perfect solution? Unlike the basic `brew install`, the `cask install` works entirely off prebuilt binaries and these are not always up-to-date.  At the time of writing the [cask](https://formulae.brew.sh/cask/macvim) and the [formula](https://formulae.brew.sh/formula/macvim) are in sync (if you go to the linked-to entries, you can find the version by going to the "JSON API" link and then searching for `url` in the cask entry and `stable` in the formula entry.)

If the `cask` is up-to-date when reading this, then it seems the best option to go with, the MacVim project download being the fallback.

For more information, see the ["brew linkapps deprecated"](https://github.com/macvim-dev/macvim/issues/450) issue for MacVim, the ["macvim does not install MacVim.app"](https://github.com/Homebrew/homebrew-core/issues/20707) issue for Homebrew and this ["brew vs brew cask"](https://apple.stackexchange.com/q/125468) question on the AskDifferent StackExchange.
