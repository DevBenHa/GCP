#!/bin/bash
SALIDA=0
LOCAL_PORT=9090
NAME_APP=account
NUMBER_IMAGE=1
NUMBER_CONTAINER=1
NAME_DOCKER_VOLUME=docker_volume

modNombreApp() 
{
    read -p "ingrese un nombre para la APP: " NAME_APP
}
modPuerto()
{
    read -p "ingrese un puerto local: " LOCAL_PORT
}
modVersionImagen() 
{
    read -p "ingrese una version para la imagen: " NUMBER_IMAGE
}
modVersionContainer()
{
    read -p "ingrese una version para el container: " NUMBER_CONTAINER
}
modNombreVolume() 
{
    read -p "ingrese un nombre de volumen: " NAME_DOCKER_VOLUME
}
modPathProperty() 
{
    read -p "ingrese un nombre para la APP: " app
}
creareContainer()
{
    NAME_CONTAINER=$NAME_APP-$NUMBER_IMAGE.$NUMBER_CONTAINER
    NAME_IMAGE=$NAME_APP-$NUMBER_IMAGE
    docker run -dit -p $LOCAL_PORT:8080 -v $NAME_DOCKER_VOLUME:/home/appmobid/data --add-host dockerhost:$DOCKERHOST --name $NAME_CONTAINER $NAME_IMAGE -e NOMBRE_CONTENEDOR=$NAME_CONTAINER

    echo ""
    echo ""
    
    docker ps
}

while [ $SALIDA -eq 0 ]
do
    clear
    echo "================================="
    echo "app: $NAME_APP"
    echo "puerto local: $LOCAL_PORT"
    echo "version-imagen: $NUMBER_IMAGE"
    echo "version-container: $NUMBER_CONTAINER"
    echo "volumen: $NAME_DOCKER_VOLUME"
    echo "================================="

    echo ""
    echo ""

    echo "============"
    echo "0 - salir   "
    echo "1 - modificar nombre de la app "
    echo "2 - modificar puerto local "
    echo "3 - modificar version imagen "
    echo "4 - modificar version container "
    echo "5 - modificar nombre volume "
    echo "6 - construir "
    echo "============"
    

    read -p "seleccione una opcion: " opcion
    if [ $opcion -eq 0 ]; then
        SALIDA=1
    elif [ $opcion -eq 1 ]; then
        modNombreApp
    elif [ $opcion -eq 2 ]; then
        modPuerto
    elif [ $opcion -eq 3 ]; then
        modVersionImagen
    elif [ $opcion -eq 4 ]; then
        modVersionContainer 
    elif [ $opcion -eq 5 ]; then
        modNombreVolume 
    elif [ $opcion -eq 6 ]; then
        creareContainer
        SALIDA=1
    else
        echo "opcion no valida"
    fi
done


