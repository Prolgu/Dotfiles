#!/usr/bin/env bash
#-*- coding: utf-8 -*-
#
#  remackie-helper.sh
#
#  2021 <https://github.com/Prolgu>
#
#
# Code start {{{
ver="0.1"
name=${0##*/}

Help() {
    # Display Help
echo -e "\
    Este script permite realizar operaciones sobre emacs --daemon\n
    Este script usa preferentemente emacs version >= 29 para poder\n
    hacer uso de 'emacsclient -nc -r', en caso de que use una version\n
    menor, sientase libre de modificarlo.
    Este script prioriza el uso de emacsclient.
        Syntaxis: remackie-helper.sh [-h|v|k|r]\n
        Opciones:
        s     Lanza emacs --daemon.
        l     Lanza emacs.
        r     Reinicia emacs --daemon.
        k     Mata el proceso emacs.
        v     Imprimir la version.
        h     Imprime esta ayuda."
}
NotifyHelp(){
notify-send "Help" "\
s- Lanza emacs(daemon).
l- Lanza emacs.
r- Reinicia emacs.
k- Mata el proceso emacs.
v- Imprimir la version.
h- Imprime ayuda.
n- Imprime este mensaje"
}
Mackie(){
    emacs --daemon
}
Kimackie(){
    PROCESSCOUNT=$(ps -ef |grep -v grep |grep -cw "emacs --daemon")
    if [ $PROCESSCOUNT -eq 1 ]
    then
		emacsclient -e '(kill-emacs)'
    else
        pkill emacs
    fi
}
Lamackie(){
    PROCESSCOUNT=$(ps -ef |grep -v grep |grep -cw "emacs --daemon")
    if [ $PROCESSCOUNT -eq 1 ]
    then
        emacsclient -nc
    else
        Mackie; emacsclient -nc
    fi
}
Remackie() {
    Kimackie;Mackie;Lamackie
}
# Get the options
while getopts ":hvkrsln" option; do # necesitas agregar las opt aca
    case $option in
        h) # Muestra Help
            Help
            exit;;
        s) # start emacs
            Mackie
            notify-send "Starting" "...in progress!"
            exit;;
        v) # Muestra version
            echo "$name Version $ver"
            exit;;
        k) # kill
            Kimackie
            notify-send "Killing" "...in progress!"
            exit;;
        r) # Reinicia
            Remackie
            exit;;
        l) # Lanza
            Lamackie
            # notify-send "Launching" "...in progress!"
            exit;;
        n) # Lanza
            NotifyHelp
            exit;;
        \?) # Invalid option
            echo "Opcion invalida"
            exit;;
    esac
done

Help

# Code end }}}
