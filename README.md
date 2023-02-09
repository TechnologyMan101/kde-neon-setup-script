# KDE Neon Setup Script
Bash script to set up a fresh install of KDE Neon.


# Documentation

Version 5.4.1

Supported KDE Neon Versions: Based on Ubuntu 22.04 LTS

Recommended Free Space: 40 GB

**Please Run Script After Following Instructions Here**

<ins>_**Make sure to update your system using the system’s software center and reboot before performing any tasks here and running the script. Failing to do so may result in severe breakage!!!**_</ins>

**The Extras folder also contains other tools you may want.**

Please install .deb files and files using other types of installation formats using files manually (if you have them).

Please add yourself to `vboxusers` using `sudo usermod -aG vboxusers $USER` in a terminal and then reboot. Only do this if you have VirtualBox installed. Since VirtualBox is installed as a DEB package on this distro, make sure to run it before the script and after installing VirtualBox if you choose to install VirtualBox. 


# Keyboard Shortcuts:

Change “Switch to next desktop” to “Ctrl+Meta+Right Arrow”

Change “Switch to previous desktop” to “Ctrl+Meta+Left Arrow”

Change “Make Window Fullscreen” to “Meta+F11”


# Language Support

After running the script, if you need additional language support, run `gnome-language-selector` in a terminal and add your languages in the resulting GUI. Reboot after installing languages. 


# Run Script:

Mark the script as executable by changing it in file properties or running `chmod +x /path/to/file`. Then run it in Terminal with `bash /path/to/file`


# Plasma Widgets

Simple Overview Pager by tuxg0d – replace default pager in taskbar


# VM Users

Minimal Install is recommended. VM Tools can be found at https://mega.nz/folder/sBwwxBTR#zf6d3UaJYnNGl5tXaN63ag in Extras or at https://github.com/TechnologyMan101/script-extras/releases.
