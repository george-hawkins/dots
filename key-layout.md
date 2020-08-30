Xmodmap
-------

`/etc/gdm3/Xsession` calls `xmodmap` on your `~/.Xmodmap` - this definitely still works, however Gnome then stomps all over whatever is configured.

It seems nowadays the only way to resolve this is via `hwdb`.

See my question [here](https://unix.stackexchange.com/q/473415/111626), the `hwdb` [man page](http://manpages.ubuntu.com/manpages/bionic/en/man7/hwdb.7.html), and this [tutorial page](https://yulistic.gitlab.io/2017/12/linux-keymapping-with-udev-hwdb/).

Note: on Ubuntu the `hwdb` DB files are found in `/lib/udev/hwdb.d/` but there's also an empty `/etc/udev/hwdb.d` directory.

At the moment I just have `xmm` aliased to call `xmodmap` on `~/.Xmodmap` but calling this once Gnome is started is too late for it to affect e.g. tabbing between windows within an application.

Xmodmap update
--------------

Xmodmap seems to be dead in Gnome - see <https://bugzilla.gnome.org/show_bug.cgi?id=721873> for their arrogant take on this - "we didn't force you to use our UIs".

Xkb seems to be the only way to go - bizarrely it doesn't seem clear that there's anyway to really use it with per-user only settings.

After trying various things covered here:

* <https://askubuntu.com/a/846184>
* <https://wiki.archlinux.org/index.php/X_keyboard_extension>
* <https://medium.com/@damko/a-simple-humble-but-comprehensive-guide-to-xkb-for-linux-6f1ad5e13450>

The eventual answer was to work thru this [AskUbuntu answer](https://askubuntu.com/a/483026) like so:

    $ sudo cp /usr/share/X11/xkb/symbols/us /usr/share/X11/xkb/symbols/us.orig
    $ sudo vim /usr/share/X11/xkb/symbols/us

Then copy the `euro` variant, remove the `eurosign` and `level3` includes and then modify it so you end up with:

    partial alphanumeric_keys
    xkb_symbols "grave_asciitilde" {

        include "us(basic)"
        name[Group1] = "English (US with Mac style grave/asciitilde location)";

        key <LSGT> { [ grave, asciitilde ] };
    };

Then:

    $ sudo cp /usr/share/X11/xkb/rules/evdev.xml /usr/share/X11/xkb/rules/evdev.xml.orig
    $ sudo vim /usr/share/X11/xkb/rules/evdev.xml

And again copy the `euro` variant and modify it so that you end up with:

    <variant>
      <configItem>
        <name>grave_asciitilde</name>
        <description>English (US with Mac style grave/asciitilde location)</description>
      </configItem>
    </variant>

Then reload the xkb data:

    $ sudo dpkg-reconfigure xkb-data

The go to Settings / Region & Language, hit plus and click "English (United States)" - you then see all the variants, including the one added above. Select it and click add and then move it to the top of the input source.

I then had to reload Gnome shell as per this [AskUbuntu answer](https://askubuntu.com/a/814336):

    $ killall -3 gnome-shell

The new input source then became available under the keyboard dropdown (top right). You can also see it as a valid source like so:

    $ gsettings get org.gnome.desktop.input-sources sources

This did cause both the key below the escape and the one beside the left-shift to generate grave and asciitilde - but the window manager still only switched between windows (of the same application) when using the key below escape. But perhaps this just needs a restart.
