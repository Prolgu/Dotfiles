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

# Usage:
#    clock list        # list available timezones
#    clock TIMEZONE    # using one of the available timezones

if [ $# != 1 ]; then
    echo Usage:
    echo $0 list
    echo or
    echo $0 TIMEZONE
    exit 2
fi

unameOut=$(uname -s)
case "${unameOut}" in
  Linux*)  machine=Linux;;
  Darwin*) machine=Mac;;
  *)       echo "${unameOut} is not supported"; exit 1
esac

if [ $1 == "list" ]; then
  case "${unameOut}" in
    Linux*)  timedatectl list-timezones; exit 0;;
    Darwin*) sudo systemsetup -listtimezones | less; exit 0;;
  esac
fi

case "${unameOut}" in
  Linux*)  TZ_LIST=$(timedatectl list-timezones --no-pager);;
  Darwin*) TZ_LIST=$(sudo systemsetup -listtimezones);;
esac

if [[ $TZ_LIST == *"$1"* ]]; then
    TZ=$1 date
    exit 0
fi

echo Invalid timezone specified!
echo Please use "$0 list" to see what timezones are available.
exit 1

