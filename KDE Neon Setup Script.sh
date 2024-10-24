#!/bin/bash
clear
# Start of Function Cluster
tput setaf 3
echo "Initializing functions..."
sleep 1.5
tput setaf 10
checkcompatibility () {
	# Set variables
	. /etc/os-release
	isneon="false"
	kernelarch=$(uname -m)
	
	# Check distro
	if ! echo $PRETTY_NAME | grep -qi "KDE neon"
	then
		sysreqfail
	fi
	isneon="true"

	# Check for 24.04 LTS
	if ! echo $VERSION_ID | grep -qi "24.04"
	then
		sysreqfail
	fi
	
	# Check kernel architecture
	if ! uname -m | grep -qi "x86_64"
	then
		sysreqfail
	fi
}
echo "Loaded checkcompatibility."
checkfreespace () {
	min_free_space=40
	free_space=$(df -h / | awk 'NR==2{print $4}' | sed 's/[^0-9.]//g')
	if [ $(echo "$free_space < $min_free_space" | bc) -eq 1 ]; then
		spacewarning
	fi
}
echo "Loaded checkfreespace."
spacewarning () {
	clear
	tput setaf 9
	echo "The script has detected that there is less than 40 GB of storage available on the root volume."
	tput setaf 3
	echo "For an ideal experience, it is recommended that the root volume has at least 40 GB of space available."
	tput setaf 10
	echo "Your current free space: $free_space GB"
	tput setaf 3
	echo "Press <return> to continue at your own risk (for re-running the script)"
	echo "Press any other key to quit"
	tput sgr0
	echo "Enter your selection:"
	IFS=""
	read -sN1 answer
	case $(echo "$answer" | tr A-Z a-z) in
		"")	mainmenu;;
		*)	quitscript;;
	esac
}
echo "Loaded spacewarning."
sysreqfail () {
	clear
	tput setaf 9
	echo "System requirements not met. This script supports x86_64 versions of KDE Neon based on Ubuntu 24.04 LTS!!!"
	tput setaf 3
	echo "If your error is not caused by a wrong KDE Neon version or OS architecture, please check to see if I have published a script for your system."
	tput setaf 10
	echo "Your current distro is $PRETTY_NAME."
	# Display KDE Neon version if KDE Neon
	if echo $isneon | grep -qi "true"
	then
		echo "Your current KDE Neon version is based on Ubuntu $VERSION_ID LTS."
	fi
	echo "Your current OS architecture is $kernelarch."
	tput sgr0
	echo "Hit any key to exit:"
	IFS=""
	read -sN1 answer
	quitscript
}
echo "Loaded sysreqfail."
mainmenu () {
	clear
 	tput setaf 3
	echo "===================================="
	echo " --- KDE Neon Setup Script 5.20 ---"
	echo "===================================="
	echo "Supported KDE Neon Versions (x86_64): Ubuntu 24.04 LTS Base"
	echo "Recommended Free Space: 40 GB"
	tput setaf 10
	echo "Your current distro is $PRETTY_NAME."
	echo "Your current KDE Neon version is based on Ubuntu $VERSION_ID LTS."
	echo "Your current OS architecture is $kernelarch."
	echo "Your current free space: $free_space GB"
	tput setaf 3
	echo "Script may prompt you or ask you for your password once in a while. Please monitor your computer until the script is done."
	echo "This script will show terminal output. This is normal."
	echo "You can open this script in a text editor to view all functions."
	tput setaf 10
	echo "You are encouraged to modify this script for your own needs."
	tput setaf 9
	echo "System will automatically reboot after the script is run!!!"
	tput setaf 10
	echo "Please run this script again after a major system upgrade."
	tput setaf 9
	echo "Make sure you have a stable and fast Internet connection before proceeding!!!"
	tput setaf 3
	echo "Press 1 to perform a Full Install (All User Packages)"
	echo "Press 2 to perform a Minimal Install (Essentials)"
	echo "Press 3 to view instructions for setting up a multi-user system"
	tput setaf 9
	echo "Press Q to quit"
	tput sgr0
	echo "Enter your selection:"
	IFS=""
	read -sN1 answer
	case $(echo "$answer" | tr A-Z a-z) in
		1)	full;;
		2)	minimal;;
		3)	multiusermenu;;
		q)	quitscript;;
		*)	badoption;;
	esac
}
echo "Loaded mainmenu."
multiusermenu () {
	clear
 	tput setaf 3
	echo "==========================================="
	echo " --- Instructions for Multi-User Setup ---"
	echo "==========================================="
	tput setaf 9
	echo "If you want to set up multiple user accounts on your computer, please run the script again with the same options on each new user account. Make sure that additional user accounts are set to Administrator. You can set accounts back to Standard after completing setup."
	tput sgr0
	echo "Hit any key to return to the main menu:"
	IFS=""
	read -sN1 answer
	mainmenu
}
echo "Loaded multiusermenu."
quitscript () {
	tput sgr0
	clear
	exit
}
echo "Loaded quitscript."
badoption () {
	clear
	tput setaf 9
	echo "Invalid Option!"
	tput setaf 3
	echo "Returning to Main Menu..."
	tput sgr0
	sleep 3
	mainmenu
}
echo "Loaded badoption."
finish () {
	clear
	tput setaf 10
	echo "Done..."
	tput setaf 9
	echo "Rebooting..."
	tput sgr0
	sleep 3
	clear
	sudo reboot
}
echo "Loaded finish."
full () {
	clear
	tput setaf 3
	echo "Full Install/All User Packages..."
	tput sgr0
	sleep 3
    clear
	common
	runcheck sudo apt install -y ubuntu-restricted-extras synaptic remmina bleachbit frozen-bubble musescore3 asunder k3b libk3b8-extracodecs pavucontrol elisa solaar p7zip-full p7zip-rar lame neofetch ffmpeg webhttrack tree android-tools-adb android-tools-fastboot kwave kamoso nikwi supertux dconf-editor ffmpegthumbs fonts-cantarell krita gimp htop curl git handbrake gtk-3-examples python3-pip cpu-x hardinfo mcomix gscan2pdf skanlite supertuxkart unzip gsmartcontrol kdenlive transmission-qt kid3 subtitlecomposer skanpage hugin kalk
	runcheck sudo dpkg --add-architecture i386
	runcheck sudo apt update -y
	runcheck sudo apt install -y libc6-i386 libx11-6:i386 zlib1g:i386 libstdc++6:i386 libgl1-mesa-dri:i386 libasound2:i386
	runcheck sudo apt install -y openjdk-17-jdk
	java -version
	sleep 3
	runcheck sudo add-apt-repository -y ppa:ubuntuhandbook1/dvdstyler
	runcheck sudo apt install -y dvdstyler
	languagepackinstall
	runcheck sudo apt update -y
	runcheck sudo apt full-upgrade -y --allow-downgrades
	runcheck sudo apt autoremove -y --purge
	runcheck sudo apt autoclean -y
	runcheck flatpak install -y flathub org.kde.kclock
	runcheck flatpak install -y flathub org.libreoffice.LibreOffice
	runcheck flatpak install -y flathub org.audacityteam.Audacity
	runcheck flatpak install -y flathub net.minetest.Minetest
	runcheck flatpak install -y flathub org.inkscape.Inkscape
	runcheck flatpak install -y flathub com.github.jeromerobert.pdfarranger
	runcheck flatpak install -y flathub com.github.muriloventuroso.pdftricks
	runcheck flatpak install -y flathub com.github.tchx84.Flatseal
	runcheck flatpak install -y flathub org.onlyoffice.desktopeditors
	runcheck flatpak install -y flathub com.calibre_ebook.calibre
	runcheck flatpak install -y flathub com.obsproject.Studio
	runcheck flatpak install -y flathub org.telegram.desktop
	runcheck flatpak install -y flathub net.lutris.Lutris
	runcheck flatpak install -y flathub io.missioncenter.MissionCenter
	runcheck flatpak install -y flathub org.prismlauncher.PrismLauncher
	runcheck flatpak install -y flathub info.febvre.Komikku
	runcheck flatpak install -y flathub io.github.diegoivan.pdf_metadata_editor
	runcheck flatpak uninstall -y --unused --delete-data
	runcheck pip3 install pip wheel -U --break-system-packages
	runcheck pip3 install --pre yt-dlp[default] -U --break-system-packages
	runcheck pip3 cache purge
	echo "Adding current user to cdrom group..."
	runcheck sudo usermod -aG cdrom $USER
	echo "Removing Solaar autostart file..."
	sudo rm /etc/xdg/autostart/solaar.desktop
	appendbashrc1
	autofontinstall
	finish
}
echo "Loaded full."
minimal () {
	clear
	tput setaf 3
	echo "Minimal Install/Essentials..."
	tput sgr0
	sleep 3
	clear
	common
	runcheck sudo apt install -y ubuntu-restricted-extras synaptic pavucontrol elisa p7zip-full p7zip-rar ffmpeg dconf-editor ffmpegthumbs fonts-cantarell htop curl git gtk-3-examples python3-pip cpu-x hardinfo gscan2pdf skanlite unzip gsmartcontrol neofetch skanpage hugin kalk
	runcheck sudo dpkg --add-architecture i386
	runcheck sudo apt update -y
	runcheck sudo apt install -y libc6-i386 libx11-6:i386 zlib1g:i386 libstdc++6:i386 libgl1-mesa-dri:i386 libasound2:i386
	languagepackinstall
	runcheck sudo apt update -y
	runcheck sudo apt full-upgrade -y --allow-downgrades
	runcheck sudo apt autoremove -y --purge
	runcheck sudo apt autoclean -y
	runcheck flatpak install -y flathub org.kde.kclock
	runcheck flatpak install -y flathub org.libreoffice.LibreOffice
	runcheck flatpak install -y flathub com.github.jeromerobert.pdfarranger
	runcheck flatpak install -y flathub com.github.muriloventuroso.pdftricks
	runcheck flatpak install -y flathub com.github.tchx84.Flatseal
	runcheck flatpak install -y flathub org.onlyoffice.desktopeditors
	runcheck flatpak install -y flathub io.missioncenter.MissionCenter
	runcheck flatpak install -y flathub info.febvre.Komikku
	runcheck flatpak install -y flathub io.github.diegoivan.pdf_metadata_editor
	runcheck flatpak update -y
	runcheck flatpak uninstall -y --unused --delete-data
	runcheck pip3 install pip wheel -U --break-system-packages
    runcheck pip3 cache purge
    appendbashrc2
	autofontinstall
	finish
}
echo "Loaded minimal."
common () {
	runcheck sudo apt update -y
	runcheck sudo apt install -y gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-plugins-good libavcodec-extra gstreamer1.0-libav chromium-codecs-ffmpeg-extra libdvd-pkg libheif1 libheif-examples libquicktime2 heif-gdk-pixbuf heif-thumbnailer kimageformat-plugins kio-extras viewnior btrfs-progs language-selector-gnome haruna kcalc krename power-profiles-daemon filelight kdenetwork-filesharing libsmbclient samba smbclient kcharselect kweather gparted gpart gnome-disk-utility aria2 simple-scan qtchooser gcc-12
	runcheck sudo dpkg-reconfigure libdvd-pkg
}
echo "Loaded common."
appendbashrcinfo () {
	clear
 	tput setaf 3
	echo "===================================="
	echo " --- Information on CLI Aliases ---"
	echo "===================================="
	echo "The 'sysupdate' alias will be added to your user profile. This is an alias that updates the computer more thoroughly. It is recommended to run this every week. This alias does not handle major system upgrades. To use this alias, run 'sysupdate' in a terminal."
	tput sgr0
	echo "Press any key to continue"
	IFS=""
	read -sN1 answer
	clear
}
echo "Loaded appendbashrcinfo."
appendbashrc1 () {
	appendbashrcinfo
	echo "Adding sysupdate alias and neofetch to .bashrc..."
	runcheck sed -i '/sysupdate/d' ~/.bashrc
	runcheck echo 'alias sysupdate="sudo apt update -y && sudo apt full-upgrade -y --allow-downgrades && sudo apt autoremove -y --purge && sudo apt autoclean -y && flatpak update -y && flatpak uninstall -y --unused --delete-data && pip3 install pip wheel -U --break-system-packages && pip3 install --pre yt-dlp[default] -U --break-system-packages && pip3 cache purge"' >> ~/.bashrc
	runcheck sed -i '/neofetch/d' ~/.bashrc
	runcheck echo 'neofetch' >> ~/.bashrc
}
echo "Loaded appendbashrc1."
appendbashrc2 () {
	appendbashrcinfo
	echo "Adding sysupdate alias and neofetch to .bashrc..."
	runcheck sed -i '/sysupdate/d' ~/.bashrc
	runcheck echo 'alias sysupdate="sudo apt update -y && sudo apt full-upgrade -y --allow-downgrades && sudo apt autoremove -y --purge && sudo apt autoclean -y && flatpak update -y && flatpak uninstall -y --unused --delete-data && pip3 install pip wheel -U --break-system-packages && pip3 cache purge"' >> ~/.bashrc
	runcheck sed -i '/neofetch/d' ~/.bashrc
	runcheck echo 'neofetch' >> ~/.bashrc
}
echo "Loaded appendbashrc2."
autofontinstall () {
	echo "Installing the Essential Font Pack..."
	runcheck sudo wget -O "/tmp/fontinstall.zip" "https://github.com/TechnologyMan101/script-extras/releases/download/20240122-2030/Essential.Font.Pack.zip"
	sudo rm -rf "/usr/share/fonts/Essential Font Pack"
	runcheck sudo unzip -o "/tmp/fontinstall.zip" -d "/usr/share/fonts"
	runcheck sudo chmod -R 755 "/usr/share/fonts/Essential Font Pack"
	runcheck sudo rm "/tmp/fontinstall.zip"
}
echo "Loaded autofontinstall."
languagepackinstall () {
	echo "Installing language packs..."
	runcheck sudo apt install -y ibus ibus-wayland ibus-mozc
	runcheck2 sudo apt install -y $(check-language-support -l en)
	runcheck2 sudo apt install -y $(check-language-support -l de)
	runcheck2 sudo apt install -y $(check-language-support -l ja)
	runcheck2 sudo apt install -y $(check-language-support -l th)
	mkdir -p ~/.config/autostart/
	rm ~/.config/autostart/ibus-daemon.desktop
	runcheck echo "[Desktop Entry]" >> ~/.config/autostart/ibus-daemon.desktop
	runcheck echo "Exec=ibus-daemon" >> ~/.config/autostart/ibus-daemon.desktop
	runcheck echo "Icon=" >> ~/.config/autostart/ibus-daemon.desktop
	runcheck echo "Name=ibus-daemon" >> ~/.config/autostart/ibus-daemon.desktop
	runcheck echo "Path=" >> ~/.config/autostart/ibus-daemon.desktop
	runcheck echo "Terminal=False" >> ~/.config/autostart/ibus-daemon.desktop
	runcheck echo "Type=Application" >> ~/.config/autostart/ibus-daemon.desktop
	runcheck chmod +x ~/.config/autostart/ibus-daemon.desktop
}
echo "Loaded languagepackinstall."
runcheck () {
	IFS=$'\n'
	command="$*"
	retval=1
	attempt=1
	until [[ $retval -eq 0 ]] || [[ $attempt -gt 5 ]]; do
		(
			set +e
			$command
		)
		retval=$?
		attempt=$(( $attempt + 1 ))
		if [[ $retval -ne 0 ]]; then
			clear
			tput setaf 9
			echo "Oops! Something went wrong! Retrying in 3 seconds..."
			tput sgr0
			sleep 3
			clear
		fi
	done
	if [[ $retval -ne 0 ]] && [[ $attempt -gt 5 ]]; then
		clear
		tput setaf 9
		echo "Oops! A fatal error has occurred and the program cannot continue. Returning to the main menu in 10 seconds..."
		tput setaf 3
		echo "Please try again later or if the problem persists, create an issue on GitHub."
		tput sgr0
		sleep 10
		clear
		mainmenu
	fi
	IFS=""
}
echo "Loaded runcheck."
runcheck2 () {
	IFS=$' \t\n'
	command="$*"
	retval=1
	attempt=1
	until [[ $retval -eq 0 ]] || [[ $attempt -gt 5 ]]; do
		(
			set +e
			$command
		)
		retval=$?
		attempt=$(( $attempt + 1 ))
		if [[ $retval -ne 0 ]]; then
			clear
			tput setaf 9
			echo "Oops! Something went wrong! Retrying in 3 seconds..."
			tput sgr0
			sleep 3
			clear
		fi
	done
	if [[ $retval -ne 0 ]] && [[ $attempt -gt 5 ]]; then
		clear
		tput setaf 9
		echo "Oops! A fatal error has occurred and the program cannot continue. Returning to the main menu in 10 seconds..."
		tput setaf 3
		echo "Please try again later or if the problem persists, create an issue on GitHub."
		tput sgr0
		sleep 10
		clear
		mainmenu
	fi
	IFS=""
}
echo "Loaded runcheck2."
tput setaf 3
echo "Continuing..."
tput sgr0
sleep 1.5
# End of Function Cluster
# Start of Main Script
while true
do
	checkcompatibility
	checkfreespace
	mainmenu
done
# End of Main Script
