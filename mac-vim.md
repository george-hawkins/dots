MacVim
======

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
