#!/bin/bash

function 3findNames {
[ ! -f $1 ] && echo "No es un archivo regular" && exit 1


for palabra in $(cat $1)
do

	PalabraDespejada=$(echo $palabra | tr -d ['.'','';''¿''´''?''!''¡']) #elimina esos caracteres de la palabra
	[[ $PalabraDespejada =~ ^[A-Z] ]] && echo $PalabraDespejada

done
}

#Analiza si la primera letra es una mayúscula de la A a la Z,
#En ese caso se muestra la palabra

