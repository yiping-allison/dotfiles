# Firejail profile for zen browser
# Description: Safe and easy web browser from Zen Browser Team
# This file is overwritten after every install/update

# Persistent local customizations
include zen.local
# Persistent global definitions
include globals.local

# (Ignore entry from disable-common.inc)
ignore read-only ${HOME}/.zen/profiles.ini

noblacklist ${HOME}/.cache/zen
noblacklist ${HOME}/.zen
noblacklist ${RUNUSER}/*zen*
noblacklist ${RUNUSER}/psd/*zen*
noblacklist ${RUNUSER}/*firefox*
noblacklist ${RUNUSER}/psd/*firefox*

blacklist /usr/libexec

mkdir ${HOME}/.cache/zen
mkdir ${HOME}/.zen
whitelist ${HOME}/.cache/zen
whitelist ${HOME}/.zen

whitelist ${RUNUSER}/*zen*
whitelist ${RUNUSER}/psd/*zen*
whitelist ${RUNUSER}/*firefox*
whitelist ${RUNUSER}/psd/*firefox*

# Note: Firefox requires a shell to launch on Arch and Fedora.
# Add the next lines to firefox.local to enable private-bin.
#private-bin bash,dbus-launch,dbus-send,env,firefox,sh,which
#private-bin basename,bash,cat,dirname,expr,false,firefox,firefox-wayland,getenforce,ln,mkdir,pidof,restorecon,rm,rmdir,sed,sh,tclsh,true,uname
private-etc zen,firefox

dbus-user filter
# Zen uses the same dbus names as Firefox.
# You can check when running zen and then using `busctl --user list` to see the names.
dbus-user.own org.mozilla.*
dbus-user.own org.mpris.MediaPlayer2.firefox.*
ignore dbus-user none

# Allow zen to access UPower
dbus-user.talk org.freedesktop.UPower
# Allow zen to access DBus
dbus-user.talk org.freedesktop.DBus

# Redirect
include /etc/firejail/firefox-common.profile
