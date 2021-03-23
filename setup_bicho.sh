#!/bin/bash

DIRECTORIO=~/nvdli-data

if [ -d "$DIRECTORIO" ] then
   echo "El directorio ${DIRECTORIO} existe"
else
   mkdir -p ~/nvdli-data
fi

echo -e "\e[96mVamos a instalar el contenedor de docker\e[0m"
echo -e "\e[91mEstas de acuerdo?: S/N\e[0m"
read respuesta

if [ "$respuesta" = "Y" ] then 
    echo "sudo docker run --runtime nvidia -it --rm --network host \
        --volume ~/nvdli-data:/nvdli-nano/data \
        --volume /tmp/argus_socket:/tmp/argus_socket \
        --device /dev/video0 \
        nvcr.io/nvidia/dli/dli-nano-ai:v2.0.1-r32.4.4" > docker_dli_run.sh

        echo "Script para docker desplegado, daremos permisos y lo ejecutamos"
        sudo chmod +x docker_dli_run.sh
        sudo ./docker_dli_run.sh
        
elif [ "$respuesta" = "N" ] then
    echo "Vale, no instalaremos nada"
    exit 0
else 
    echo "Error, no has introducido una opcion valida"
fi

