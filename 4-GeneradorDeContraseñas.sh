#! /bin/bash
# author : cabaCrd
#VARIABLES DE TRABAJO
caracteresMinus="abcdefghijqlmnopqrstuvwxyz"
caracteresMayus="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
caracteresNum="0123456789"
caracteresSimbol="!@#$%^&*_-+="
long=0
pass=""

#MENSAJE DE BIENVENIDA
echo "Saludos $USER"
echo "Vamos a generar una contraseña, por favor rellene los sigueintes campos"

#LONGITUD DE LA CONTRASEÑA
while true; do
    echo "Introduzca la longitud de la contraseña (entre 8 y 2048 caracteres) [OBLIGATORIO]:"
    read -r long
    if (( long < 8 )); then
        echo "Contraseña demasiado corta. Debe tener al menos 8 caracteres."
    elif (( long > 2048 )); then
        echo "Contraseña demasiado larga. Debe tener como máximo 2048 caracteres."
    else
        break
    fi
done

#MINUSCULAS
while true; do
    echo "¿Quiere que contenga minúsculas? (S/N)" 
    read -r minu
    if [[ $minu != "S" && $minu != "N" ]]; then
        echo "Comando inválido"
    else
        break
    fi
done

#MAYUSCULAS
while true; do
    echo "¿Quiere que contenga mayúsculas? (S/N)" 
    read -r mayu
    if [[ $mayu != "S" && $mayu != "N" ]]; then
        echo "Comando inválido"
    else
        break
    fi
done

#NUMEROS
while true; do
    echo "¿Quiere que contenga números? (S/N)" 
    read -r nume
    if [[ $nume != "S" && $nume != "N" ]]; then
        echo "Comando inválido"
    else
        break
    fi
done

#SIMBOLOS
while true; do
    echo "¿Quiere que contenga símbolos? (S/N)" 
    read -r simbo
    if [[ $simbo != "S" && $simbo != "N" ]]; then
        echo "Comando inválido"
    else
        break
    fi
done

#CADENA CON LAS OPCIONES SELECCIONADAS
cadena="" 
#SI SE SELECCIONARON LAS MINUSCULAS
if [[ $minu == "S" ]]; then 
    cadena+="$caracteresMinus"
fi
#SI SE SELECCIONARON LAS MAYUSCULAS
if [[ $mayu == "S" ]]; then 
    cadena+="$caracteresMayus" 
fi
#SI SE SELECCIONARON LAS NUMEROS
if [[ $nume == "S" ]]; then 
    cadena+="$caracteresNum" 
fi
#SI SE SELECCIONARON LAS SIMBOLOS
if [[ $simbo == "S" ]]; then 
    cadena+="$caracteresSimbol" 
fi
#SI NO SELECCIONAMOS NINGUNA OPCIÓN
if [[ -z $cadena ]]; then
    echo "Ninguna opción seleccionada, no se generará la contraseña" 
    exit 1
fi
#OBTENEMOS LA LONGITUD DE LA CADENA
length=${#cadena}
#BUCLE PARA GENERAR LA CONTRASEÑA
for ((i = 0 ; i < $long; i++)); do
    #OBTENEMOS UN INDICE ALEATORIO DE LA CADENA
    index=$((RANDOM % length))
    #SE LO SUMAMOS A NUESTRA NUEVA CONTRASEÑA
    pass+=${cadena:index:1}		
done
#MOSTRAMOS LA CONTRASEÑA
echo "Su contraseña es:"
echo $pass
