#! /bin/bash
#  Author       : TiWim
#  Date         : 17 / 07 / 15
#  Description  : Pause/play switcher for vlc or any other media player
#  Use          : insert a line in your configs to bind it to a key combination

media="vlc"


pid=$(pidof $media)
state=$(ps aux | grep -v grep | grep $pid | awk '{print $8}')

if [[ $state == 'Sl' ]]
then
    echo stopping $media
    kill -STOP $pid
else
    echo launching $media
    kill -CONT $pid
fi

exit 0

