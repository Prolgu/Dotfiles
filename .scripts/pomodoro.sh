#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# Copyright (c) 2022 Matias Bonina <https://github.com/Prolgu>

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# A simple shell script to use as a pomodoro app.
# The first argument is the focus time length.
# The second argument is the break length.
# Made by Kiailandi (https://github.com/kiailandi)

wseconds=${1:-25}*60;
pseconds=${2:-wseconds/300}*60;

# Check os and behave accordingly
if [ "$(uname)" == "Darwin" ]; then
    while true; do
        date1=$((`date +%s` + $wseconds));
        while [ "$date1" -ge `date +%s` ]; do
            echo -ne "$(date -u -j -f %s $(($date1 - `date +%s`)) +%H:%M:%S)\r";
        done
        osascript -e 'display notification "Time to walk and rest!" with title "Break"';
        read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n';
        date2=$((`date +%s` + $pseconds));
        while [ "$date2" -gt `date +%s` ]; do
            echo -ne "$(date -u -j -f %s $(($date2 - `date +%s`)) +%H:%M:%S)\r";
        done
        osascript -e 'display notification "Time to get back to work" with title "Work"';
        read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n';
    done
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    while true; do
        date1=$((`date +%s` + $wseconds));
        while [ "$date1" -ge `date +%s` ]; do
            echo -ne "$(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r";
        done
        notify-send "Break" "Time to walk and rest";
        read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n';
        date2=$((`date +%s` + $pseconds));
        while [ "$date2" -ge `date +%s` ]; do
            echo -ne "$(date -u --date @$(($date2 - `date +%s` )) +%H:%M:%S)\r";
        done
        notify-send "Work" "Time to get back to work";
        read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n';
    done
else
    echo -ne "Your OS is currently not supported\n";
fi

