#! /bin/bash
#
#   Author: TiWim
#     Date: 07 / 28 / 15
#
###############################################################################

cp /home/*/.bashrc /root/

baseInstall(){
#   echo 'Acquire::http { Proxy "http://192.168.1.29:3142"; };' > /etc/apt/apt.conf
    apt-get update
    apt-get install -y bash-completion vim htop git locate tmux screen axel
}

graphical(){
    apt-get install -y xserver-xorg-video-{nouveau,vesa} xinit i3{,-wm,status,lock}
    apt-get install -y xserver-xorg-input-all notify-bin
    apt-get install -y xterm
    apt-get install -y iceweasel icedove zathura feh ghex
}


wineUtilities(){
    dpkg --add-architecture i386
    apt-get update
    apt-get install -y wine:i386
}

hackUtilities(){
    apt-get install -y netcat telnet dnsutils ldap-utils tshark curl nmap lynx ssh aircrack-ng
    apt-get install -y build-essential ltrace strace spidermonkey-bin upx
    apt-get install -y volatility foremost poppler-utils libimage-exiftool-perl crunch john
    apt-get install -y audacity # vlc alsaplayer ?
}

# Don't know if it is really necessary.
kaliPackages(){
    echo "deb http://http.kali.org/kali kali main contrib non-free" > /etc/apt/sources.list.d/kali.list
    echo "deb http://security.kali.org/kali-security kali/updates main contrib non-free" >> /etc/apt/sources.list.d/kali.list
    # could be "dangerous" (newest versions of sqlmap, john, metasploit, ...)
    # use with "-t kali-bleeding-edge"
    echo "deb http://repo.kali.org/kali kali-bleeding-edge main contrib non-free" >> /etc/apt/sources.list.d/kali.list
    apt-get update
    apt-get install -y --force-yes vega sqlmap hashcat #metasploit

}

gitRepositories(){
    wget http://github.com/deathmarine/Luyten/releases/download/v0.4.4/luyten-0.4.4.jar
    git clone https://github.com/sqlmapproject/sqlmap.git
    git clone https://github.com/magnumripper/JohnTheRipper.git
    git clone https://github.com/longld/peda.git ~/peda
    echo "source ~/peda/peda.py" >> ~/.gdbinit
}


### Add a Menu ###
#graphical
#baseInstall
#hackUtilities
#kaliPackages & gitRepositories
wineUtilities
### Add a Menu ###


exit 0
