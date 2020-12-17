#!/bin/bash 
#------------------------------
# Script para notas personales
#------------------------------
comm=$1

sed '/^$/d' ./data.log
read -p "Ingresa tu comentario >> " linea
echo $linea $(date "+%T %D") >> data.log

if test "$comm" == "c"
then
    echo -n "" > data.log
    exit 
elif test "$comm" == "r"
then
    cat data.log
    exit 
elif test "$comm" == "d"
then
    rm data.log
    echo "Archivo log borrado."
    exit
elif test "$comm" == "n"
then
    echo "Hay" $( wc -l < data.log) "lineas."
    exit
elif test "$comm" == "u"
then 
    tail -n 1 data.log
    exit
fi

