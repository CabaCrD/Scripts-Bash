#! /bin/bash
#Author: CabaCrD
#ESTE SCRIPT NOS SERVIRA PARA MOVER LOS ARCHIVOS DESCARGADOS DE UNA SENTADA

#LAS CUATRO FUNCIONES PARA MOVER Y MOSTRAR ARCHIVOS FUNCIONAN IGUAL, CON UN BUCLE FOR RECORREREMOS EL DIRECTORIO Y MOVEMEROS LOS
#ARCHIVOS, ADEMAS DE MOSTRAR UN CONTADOR CON LOS ARCHIVOS DISPONIBLES Y ARCHIVOS MOVIDOS

#MOSTRAREMOS LOS FICHEROS DE LA CARPETA DESCARGAS
mostrar_ficheros (){
    contador=0
    contadorAudio=0
    echo "|----------------------|"
    echo "|   FICHEROS DE AUDIO  |"
    echo "|----------------------|"
    for archivo in /home/"$USER"/Descargas/*.{mp3,wav,ogg,wav,au,mpeg-4,aac,opus,dsd}; do
        if [ -f "$archivo" ]; then
            echo "$archivo"
            ((contador++))
            ((contadorAudio++))
        fi
    done
    echo "-- Total de ficheros de audio: $contadorAudio"
    #-------------
    contadorVideo=0
    echo "|----------------------|"
    echo "|  FICHEROS DE VIDEO   |"
    echo "|----------------------|"
    for archivo in /home/"$USER"/Descargas/*.{avi,mp4,mkv,flv,mov,wmv,divx,xdiv,rm}; do
        if [ -f "$archivo" ]; then
            echo "$archivo"
            ((contador++))
            ((contadorVideo++))
        fi
    done
    echo "-- Total de ficheros de video: $contadorVideo"
    #-------------
    contadorIMG=0
    echo "|----------------------|"
    echo "|  FICHEROS DE IMAGEN  |"
    echo "|----------------------|"
    for archivo in /home/"$USER"/Descargas/*.{jpg,jpeg,png,gif,psd,svg,bmp}; do
        if [ -f "$archivo" ]; then
            echo "$archivo"
            ((contador++))
            ((contadorIMG++))
        fi
    done
    echo "-- Total de ficheros de imagen: $contadorIMG"
    #-------------
    contadorDocumentos=0
    echo "|----------------------|"
    echo "|FICHEROS DE DOCUMENTOS|"
    echo "|----------------------|"
    for archivo in /home/"$USER"/Descargas/*.{doc,docx,dot,epub,pdf,csv,odt,dotx,ott,fott}; do
        if [ -f "$archivo" ]; then
            echo "$archivo"
            ((contador++))
            ((contadorDocumentos++))
        fi
    done
    #-------------
    echo "-- Total de ficheros de documentos: $contadorDocumentos"
    echo "-- Total de archivos: $contador"
}

#MOVEREMOS LA MUSICA
mover_musica (){
    contador=0
    echo "|----------------------|"
    echo "|   FICHEROS DE AUDIO  |"
    echo "|----------------------|"
    mkdir -p "/home/$USER/Música/Descargas"
    for archivo in /home/"$USER"/Descargas/*.{mp3,wav,ogg,wav,au,mpeg-4,aac,opus,dsd}; do
        if [ -f "$archivo" ]; then
            mv "$archivo" "/home/$USER/Música/Descargas"
            ((contador++))
        fi
    done
    echo "-- Total de archivos movidos: $contador"
}

#MOVEREMOS LAS IMAGENES
mover_imagenes (){
    contador=0
    echo "|----------------------|"
    echo "|  FICHEROS DE IMAGEN  |"
    echo "|----------------------|"
    mkdir -p "/home/$USER/Imágenes/Descargas"
    for archivo in /home/"$USER"/Descargas/*.{jpg,jpeg,png,gif,psd,svg,bmp}; do
        if [ -f "$archivo" ]; then
            mv "$archivo" "/home/$USER/Imágenes/Descargas"
            ((contador++))
        fi
    done
    echo "-- Total de archivos movidos: $contador"
}

#MOVEREMOS LOS VIDEOS
mover_videos (){
    contador=0
    echo "|----------------------|"
    echo "|  FICHEROS DE VIDEO   |"
    echo "|----------------------|"
    mkdir -p "/home/$USER/Vídeos/Descargas"
    for archivo in /home/"$USER"/Descargas/*.{avi,mp4,mkv,flv,mov,wmv,divx,xdiv,rm}; do
        if [ -f "$archivo" ]; then
            mv "$archivo" "/home/$USER/Vídeos/Descargas"
            ((contador++))
        fi
    done
    echo "-- Total de archivos movidos: $contador"
}

#MOVERENMOS LOS DOCUMENTOS
mover_documentos(){
    contador=0
    echo "|----------------------|"
    echo "|FICHEROS DE DOCUMENTOS|"
    echo "|----------------------|"
    mkdir -p "/home/$USER/Documentos/Descargas"
    for archivo in /home/"$USER"/Descargas/*.{doc,docx,dot,epub,pdf,csv,odt,dotx,ott,fott}; do
        if [ -f "$archivo" ]; then
            mv "$archivo" "/home/$USER/Documentos/Descargas"
            ((contador++))
        fi
    done
    echo "-- Total de archivos movidos: $contador"
}

start_program () {
    clear
    opcion=0
    while true; do
        echo "|------------------------------------------|"
        echo "|           ¿Que desea hacer hoy?          |"
        echo "|------------------------------------------|"
        echo "-- 1. Mostrar todos los ficheros de Descargas"
        echo "-- 2. Mover musica de la carpeta descargas a la biblioteca"
        echo "-- 3. Mover imágenes de la carpeta descargas a la biblioteca"
        echo "-- 4. Mover vídeos de la carpeta descargas a la biblioteca"
        echo "-- 5. Mover documentos de la carpeta descargas a la biblioteca"
        echo "-- 6. Mover todo"
        echo "-- 7. Limpiar la carpeta descargas"
        echo "-- 8. Salir"
        read -r opcion
        case $opcion in
            1)
                clear
                mostrar_ficheros
                ;;
            2)
                clear
                mover_musica
                ;;
            3)  
                clear
                mover_imagenes
                ;;
            4)
                clear
                mover_videos
                ;;
            5)
                clear
                mover_documentos
                ;;
            6)
                clear
                mover_musica
                mover_imagenes
                mover_videos
                mover_documentos               
                ;;
            7)  
                clear
                rm -r /home/$USER/Descargas
                mkdir /home/$USER/Descargas
                echo "-- Carpeta vaciada"
                ;;
            8)
                echo "Cerrando el Script"
                break
                ;;
            *)
                echo "Opción inválida"
                ;;
        esac
    done
}

start_program