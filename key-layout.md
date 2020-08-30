Xkb
===

There used to be various different ways to set up your key layout. They've all been killed off gradually (see previous revisions of this file for more details). Xkb now seems to be the only way to go. Oddly, it doesn't seem clear that there's anyway to use it with per-user only settings, you have to make system-wide visible changes.

After trying various things, this is the approach I came up with (largely based off this AskUbuntu [answer](https://askubuntu.com/a/483026)):

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

The go to _Settings / Region & Language_, click the plus and then _English (United States)_ - you then see all the variants, including the one added above. Select it and click _Add_ and then move it to the top of the _Input Sources_.

Neither the new input source nor the keyboard dropdown become visible until you logout and re-login. Or reload the Gnome shell as per this AskUbuntu [answer](https://askubuntu.com/a/814336):

    $ killall -3 gnome-shell

The new input source then becomes available under the keyboard dropdown (top right).

For whatever reason, the window manager still only recognizes the tilde below the escape for switching between windows of the same application. In all other situations, everything works as expected.
