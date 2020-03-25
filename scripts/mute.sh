#!/bin/bash
#
Testmute=`pulsemixer --get-mute`
if [ $Testmute == 1 ];then
    pulsemixer --unmute
else
    pulsemixer --mute
fi
