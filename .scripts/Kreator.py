#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Kreator.py
#
# Pr0LgU <https://github.com/Prolgu>
#

import os
#el camino donde esta mi carpeta
#expando para poder usarlo desde cualquier lugar
path=os.path.expanduser("~/Documentos/WebDesigne/Proyectos/")

#limpieza de linea
os.system('clear')

#pido nombre del proyecto
pro=input("Nombre del Proyecto\n>>> ")

#creo directorios
os.makedirs(path+pro+"/css",exist_ok=True)
os.makedirs(path+pro+"/img",exist_ok=True)

#creo los archivos dentro de las carpetas
fcss= open("{0}{1}/css/master.css".format(path,pro),"w+")
findex= open("{0}{1}/index.html".format(path,pro),"w+")
fjs= open("{0}{1}/myScript.js".format(path,pro),"w+")

tmplt=os.path.expanduser("~/.scripts/tmplt")
fndx=os.path.expanduser(path+pro+"/index.html")
with open(tmplt) as f:
    with open(fndx, "w") as f1:
        for line in f:
            f1.write(line)


