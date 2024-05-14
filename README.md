# KDE Neon Setup Script
Bash script to set up a fresh install of KDE Neon.


# Documentation

Version 5.18

Supported KDE Neon Versions: Based on Ubuntu 22.04 LTS

Recommended Free Space: 40 GB

**Please Run Script After Following Instructions Here**

<ins>_**Make sure to update your system using the system’s software center and reboot before performing any tasks here and running the script. Failing to do so may result in severe breakage!!!**_</ins>

**The Extras folder also contains other tools you may want.**

Please install .deb files and files using other types of installation formats using files manually (if you have them).

Please add yourself to `vboxusers` using `sudo usermod -aG vboxusers $USER` in a terminal and then reboot. Only do this if you have VirtualBox installed. Since VirtualBox is installed as a DEB package on this distro, make sure to run it before the script and after installing VirtualBox if you choose to install VirtualBox. 


# Keyboard Shortcuts:

Add shortcut for “Decrease Microphone Volume” using the keys “Meta+Ctrl+Alt+Down”

Add shortcut for “Decrease Volume” using the keys “Ctrl+Alt+Down”

Add shortcut for “Increase Microphone Volume” using the keys “Meta+Ctrl+Alt+Up”

Add shortcut for “Increase Volume” using the keys “Ctrl+Alt+Up”

Add shortcut for “Mute” using the keys “Ctrl+Alt+Shift+Down”

Add shortcut for “Mute Microphone” using the keys “Meta+Ctrl+Alt+Shift+Down”

Add shortcut for “Media playback next” using the keys “Ctrl+Alt+End”

Add shortcut for “Media playback previous” using the keys “Ctrl+Alt+Home”

Add shortcut for “Play/Pause media playback” using the keys “Ctrl+Alt+Shift+Up”

Add shortcut for “Make Window Fullscreen” using the keys “Meta+F11”


# Language Packs:

The script will install language support packages for English, German, Japanese, and Thai. IBus will also be installed, specifically including the packages `ibus`, `ibus-wayland`, and `ibus-anthy`. If you would like to change the selection of languages or IBus modules, please edit the `languagepackinstall` function in the script. However, it is recommended to keep at least the English language pack and the packages `ibus` and `ibus-wayland`. 


# Flatpak Applications and Cursor Themes:

This issue mainly affects users on Wayland, which is the default session. If a Flatpak application displays a incorrect cursor theme or size, run `mkdir -p ~/.local/share/icons/default/ && nano ~/.local/share/icons/default/index.theme` in Terminal and type `[Icon Theme]`, then press Enter and type `Inherits=breeze_cursors`. Save the file by pressing Ctrl+X, then `y`, and then Enter. Make sure to change these variable values as appropriate to your system, as these follow KDE defaults. For example, if you use the white variant of the default Breeze cursors, change the value of the `Inherits` property to `Breeze_Light`. 


# Overview Shortcut:

Mark the `KDE Overview Shortcut.desktop` file as executable by changing permissions in file properties or running `chmod +x /path/to/file`. Then drag the file to the panel between the Application Launcher icon and the first application shortcut. This adds the shortcut as a widget. Note that the shortcut will not work until the script has been run due to dependencies. If you do not want to use the default workspace pager in addition to this shortcut, remove the default workspace pager. 


# Run Script:

Mark the script as executable by changing it in file properties or running `chmod +x /path/to/file`. Then run it in Terminal with `bash /path/to/file`


# VM Users

Minimal Install is recommended. VM Tools can be found at https://mega.nz/folder/sBwwxBTR#zf6d3UaJYnNGl5tXaN63ag in Extras or at https://github.com/TechnologyMan101/script-extras/releases.
