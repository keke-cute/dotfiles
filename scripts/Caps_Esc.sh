#!/usr/bin/env bash

exec setxkbmap -option ctrl:swapcaps &
exec xcape -e 'Control_L=Escape'
