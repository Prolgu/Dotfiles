#!/usr/bin/env bash
#-*- coding: utf-8 -*-
#
#  titulo.sh
#
#  2021 <https://github.com/Prolgu>
#
#
#
# Code start {{{
Help()
{
    # Display Help
    echo "Add description of the script functions here."
    echo
    echo "Syntax: scriptTemplate [-g|h|v|V]"
    echo "options:"
    echo "g     Print the GPL license notification."
    echo "h     Print this Help."
    echo "v     Verbose mode."
    echo "V     Print software version and exit."
    echo
}

# Get the options
while getopts ":hV" option; do # necesitas agregar las opt aca
    case $option in
        h) # display Help
            Help
            exit;;

        V) # display error
            echo "Version 1.4"
            exit;;
        \?) # display error
            echo "Invalid option"
            exit;;
    esac
done

echo "Hello world!"




# Code end }}}

