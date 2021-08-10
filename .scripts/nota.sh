#!/bin/bash
param=$1
ayuda="Ayuda:\n\th: Ayuda.\n\tw: Escribe.\n\tr: Lee.\n\tu: LineaF.\n\tn: Lineas.\n\tl: Limpia."
dataF="$HOME/.scripts/data.log"

if [ ! -f "$dataF" ] ; then
     touch $dataF    
fi

case $param in
    "l") echo -n "" > $dataF 
    ;;
    "r") cat $dataF
    ;;
    "w") read -p "Ingresa tu comentario >> " linea
         echo $linea $(date "+%T %D") >> $dataF
    ;;
    "u") tail -n 1 $dataF
    ;;
    "n") echo "Hay" $(wc -l < $dataF) "lineas." 
    ;;
    "h") echo -e $ayuda
    ;;
    "*") read -p "Ingresa tu comentario >> " linea
         echo $linea $(date "+%T %D") >> $dataF
    ;;
esac
