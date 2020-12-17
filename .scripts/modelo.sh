#!/bin/bash
var="#!/bin/bash\n# -*- coding: utf-8 -*-#\n#  $1.py\n#\n#  Pr0LgU <https://github.com/Prolgu>\n#\n\n"

param=$1
echo -e $var >> "$param.sh"
chmod +x "$param.sh"
