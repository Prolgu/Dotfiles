#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# condicion.py
#
# Pr0LgU <https://github.com/Prolgu>



import os
from time import strftime

#variables utiles para el programa
horario=strftime("%d.%b.%Y (%H:%M)")
lineas = []
os.system('clear')

#bucle para escribir, se sale con linea vacia y enter
while True:
    s = input(">>> ")
    if s:
        lineas.append(s)
    else:
        break;

#conversion de lista en varias lineas con salto
procesado="\n".join(lineas)

with open("log","a") as file:
    file.write(f"\n========== {horario} ==========\n")
    file.write(procesado)
    file.write(f"\n========== {horario} ==========\n")
    file.close()
