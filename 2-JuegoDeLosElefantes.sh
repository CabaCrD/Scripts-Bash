#! /bin/bash
#Author: CabaCrD
#UN SIMPLE SCRIPT PARA PROBAR TRABAJAR CON EL BUCLE FOR Y LA FUNCION READ DE BASH
#MENSAJE DE BIENVENIDA
echo "¿Cuantos elefantes crees que aguantará la telaraña?(1/3000)"
#INTRODUCIR LA CANTIDAD DE ELEFANTES
read elefante
#NUMERO ALEATORIO
capacidadTela=`echo $(($RANDOM))`
#BUCLE FOR
for ((i=1; i < capacidadTela ; i++ ))
    do  
        echo "$i Elefantes se balanceaban sobre la tela de una araña"
    done
#SI NOS ACERTAMOS
if [ $elefante -eq $capacidadTela ]; then
        echo "has acertado"
fi
#SI NOS PASAMOS
if [ $elefante -gt $capacidadTela ]; then
        echo "Te has pasado de la raya"
fi
#SI NO QUEDAMOS CORTOS
if [ $elefante -lt $capacidadTela ]; then
        echo "Te has quedado corto"
fi