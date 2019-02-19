#!/bin/bash
SALIDA=0
NAME_APP=account
NUMBER_IMAGE=1
NAME_DOCKER_VOLUME=docker_volume
PATH_PROPERTIES=/home/appmobid/apps/tomcat

modNombreApp() 
{
    read -p "ingrese un nombre para la APP: " NAME_APP
}
modVersionImagen() 
{
    read -p "ingrese una version para la imagen: " NUMBER_IMAGE
}
modNombreVolume() 
{
    read -p "ingrese un nombre de volumen: " NAME_DOCKER_VOLUME
}
modPathProperty() 
{
    read -p "ingrese un path para el propeties: " PATH_PROPERTIES
}
buildImage()
{
    PATH_DOCKER_VOLUME=/var/lib/docker/volumes
    NAME_IMAGE=$NAME_APP-$NUMBER_IMAGE
#    PATH_PROPERTIES_APP=$PATH_PROPERTIES/$NAME_APP/properties
    PATH_VOLUME=$PATH_DOCKER_VOLUME/$NAME_DOCKER_VOLUME/_data
    
    sudo cp $PATH_PROPERTIES/$NAME_APP/properties/*.properties $PATH_VOLUME/$NAME_APP/properties/
    sudo cp $PATH_PROPERTIES/$NAME_APP/files/* $PATH_VOLUME/$NAME_APP/files/
    
    docker build -t $NAME_IMAGE .
    
    echo ""
    echo ""
    
    docker images
}

while [ $SALIDA -eq 0 ]
do
    clear
    echo "================================="
    echo "app: $NAME_APP"
    echo "version-imagen: $NUMBER_IMAGE"
    echo "volumen: $NAME_DOCKER_VOLUME"
    echo "path properties: $PATH_PROPERTIES"
    echo "================================="

    echo ""
    echo ""

    echo "================================="
    echo "0 - salir                        "
    echo "1 - modificar nombre de la app   "
    echo "2 - modificar version imagen     "
    echo "3 - modificar nombre volume      "
    echo "4 - modificar el path properties "
    echo "5 - construir                    "
    echo "================================="
    



    read -p "seleccione una opcion: " opcion
    
    if [ $opcion -eq 0 ]; then
        SALIDA=1
    elif [ $opcion -eq 1 ]; then
        modNombreApp
    elif [ $opcion -eq 2 ]; then
        modVersionImagen 
    elif [ $opcion -eq 3 ]; then
        modNombreVolume 
    elif [ $opcion -eq 4 ]; then
        modPathProperty
    elif [ $opcion -eq 5 ]; then
        buildImage
        SALIDA=1 
    else
        echo "opcion no valida"
    fi
done








