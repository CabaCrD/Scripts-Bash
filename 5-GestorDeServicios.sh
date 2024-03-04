#! /bin/bash

#Author: CabaCrD
#ESTE SCRIPT ES UIN GESTOR DE SERVICIOS DEL SISTEMA

#CON ESTO LISTAREMOS LOS SERVICIOS QUE TENEMOS DISPONIBLES
listar_servicios () {
    opcion=0
    while true; do
        echo "Seleccione una opción"
        echo "-- 1. Listar servicios Activos"
        echo "-- 2. Listar servicios Inactivos"
        echo "-- 3. Listar servicios Habilitados"
        echo "-- 4. Listar servicios Deshabilitados"
        echo "-- 5. Listar todo"
        echo "-- 6. Salir "
        echo ""
        read -r opcion
        case $opcion in
            1)
                systemctl list-units --type=service --state=active
                ;;
            2)
                systemctl list-units --type=service --state=inactive
                ;;
            3)
                systemctl list-unit-files --type=service --state=enabled
                ;;
            4)
                systemctl list-unit-files --type=service --state=disabled
                ;;
            5)
                systemctl list-units --type=service
                ;;
            6)
                break
                ;;
            *)
                echo "Opción inválida"
                ;;
        esac
    done
}

#SIMPLEMENTE COMPROBAREMOS EL ESTADO DE LOS SERVICIOS
comprobar_servicios () {
    while true; do
        echo "Introduza el nombre del servicio"
        read -r servicio
        systemctl status "$servicio"
        break
    done

}

#AQUI TENDREMOS VARIAS OPCIONES PARA MODIFICAR EL ESTADO DE LOS SERVICIOS
modificar_servicios () {
    while true; do
        echo "Seleccione una opcion"
        echo "-- 1. Habilitar un servicio [enable]"
        echo "-- 2. Deshabilitar un servicio [disable]"
        echo "-- 3. Activar un servicio [start]"
        echo "-- 4. Desactivar servicio [stop]"
        echo "-- 5. Reiniciar servicio [reload-or-restart]" 
        echo "-- 6. Salir"
        read -r opcion
        case $opcion in
            1)
                echo "Escriba el nombre del servicio a habilitar [enable]"
                read -r servicio
                sudo systemctl enable "$servicio"
                systemctl status "$servicio"
                ;;
            2)
                echo "Escriba el nombre del servicio a deshabilitar [disable]"
                read -r servicio
                sudo systemctl disable "$servicio"
                systemctl status "$servicio"
                ;;
            3)
                echo "Escriba el nombre del servicio a activar [start]"
                read -r servicio
                sudo systemctl start "$servicio"
                systemctl status "$servicio"
                ;;
            4)
                echo "Escriba el nombre del servicio a activar [stop]"
                read -r servicio
                sudo systemctl stop "$servicio"
                systemctl status "$servicio"
                ;;
            5)
                echo "Escriba el nombre del servicio a activar [reload-or-restart]"
                read -r servicio
                sudo systemctl reload-or-restart "$servicio"
                systemctl status "$servicio"
                ;;
            6)
                break
                ;;
            *)
                echo "Opción inválida"
                ;;
        esac
    done
}

#PARA ARRANCAR EL SCRIPT Y MOSTRAR EL MENU PRINCIPAL
start_Script () {
    menu=0
    while true; do
        echo "  |*************************************|"
        echo "  |              BIENVENIDO             |"
        echo "  |  *********************************  |"
        echo "  | 1. Listar servicios                 |" 
        echo "  |  *********************************  |"
        echo "  | 2. Comprobar estado de servicio     |"
        echo "  |  *********************************  |"
        echo "  | 3. Modificar servicio               |"
        echo "  |  *********************************  |"
        echo "  | 4. Salir                            |"
        echo "  |*************************************|"
        echo "Seleccione una opción"
        read -r menu
        case $menu in
            1)
                listar_servicios
                ;;
            2)
                comprobar_servicios
                ;;
            3)
                modificar_servicios
                ;;
            4)
                echo "Cerrando el Script"
                break
                ;;
            *)
                echo "Opción inválida"
                ;;
        esac
    done
}

start_Script