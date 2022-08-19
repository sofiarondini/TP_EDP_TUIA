#!/bin/bash

function 2statsUsageWords {
[ ! -f $1 ] && echo "Archivo inexistente, intente nuevamente" && exit 1

#Si no es un archivo muestra el mensaje 

for palabra in $(cat $1)
do


  if [[ $(($(echo $palabra | wc -m)-1)) -ge 4 ]] #wc -m cuenta la cantidad de caracteres de la plabra
  then
    cont=0


    for word in $(cat $1)
    do
    if [[ $palabra = $word ]]
    then
      cont=$(($cont+1))
    fi
    done
    echo $cont $palabra >> temp.txt
   fi
done

#cuando salimos del for ya tenemos el archivo temp  que tiene dos columnas
#donde la primera tiene la cantidad de veces que aparece la palabra en el
#archivo que se le paso como argumento y en la segunda la palabra
#ahora necesitamos ordenarlo de mayor a menor

sort -g temp.txt > orden.txt #lo ordenada de menor a mayor según el nùmero
 cat orden.txt | uniq > ordenlisto.txt #eliminan las que están líneas que están repetidas
 sort -r ordenlisto.txt > ordenalreves.txt #sort -r ordena al revés
 head ordenalreves.txt #head muestra las primeras 10 líneas 
 rm temp.txt #eliminamos el temporal para que cuando
# lo volvamos a ejecutar este limpio


}
