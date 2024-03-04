#!/bin/bash
#Author: CabaCrD
# UN SIMPLE SCRIPT PARA PROBAR TRABAJAR CON BUCLES DO WHILE Y LA FUNCION SLEEP
# NUMERO ALEATORIO

#SALUDOS AL JUGADOR CON ESPERAS
echo "Saludos $USER"
sleep 2
echo "Vamos a jugar a un juego"
sleep 2
echo "El juego que vamos a jugar es la ruleta rusa"
sleep 2
echo "Empiezas tu"

aleatorioTambor=$((RANDOM % 6 + 1))
ganador=0

#BUCLE PARA GIRAR EL TAMBOR
for i in {1..6}; do
        echo "Presiona [Enter] para girar el tambor"
        read
        echo "Girando el tambor..."
        sleep 2

        aleatorioJugador=$((RANDOM % 6 + 1))
        aleatorioConsola=$((RANDOM % 6 + 1))

        #SI LE TOCA AL JUGADOR
        if [ "$aleatorioJugador" -eq "$aleatorioTambor" ]; then
                echo "!!!BAAANG¡¡¡ ($USER ha perdido)"
                ganador=1
                break
        fi
    
         #SI LE TOCA A LA CONSOLA
        if [ "$aleatorioConsola" -eq "$aleatorioTambor" ]; then
                echo "!!!BAAANG¡¡¡ (La consola ha perdido)"
                ganador=1
                break
        fi

        #CUANDO NADIE RECIBE LA BALA
        echo "Nadie ha perdido esta vez..."
done

#SI DESPUES DE 6 INTENTOS NADIE RECIBE LA BALA
if [ $ganador -eq 0 ]; then
    echo "Que suerte, parece que la bala estaba defectuosa"
fi
