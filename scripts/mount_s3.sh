#!/bin/bash

# Verifica si se proporcionó el nombre del bucket
if [ $# -eq 0 ]; then
    echo "Por favor, proporciona el nombre del bucket S3 como argumento."
    exit 1
fi

BUCKET_NAME=$1
MOUNT_POINT="/mnt/s3bucket"

# Instalar s3fs si no está instalado
if ! command -v s3fs &> /dev/null; then
    echo "Instalando s3fs..."
    sudo yum install -y s3fs-fuse
fi

# Crear el punto de montaje si no existe
if [ ! -d "$MOUNT_POINT" ]; then
    sudo mkdir -p "$MOUNT_POINT"
fi

# Montar el bucket S3
echo "Montando el bucket S3 $BUCKET_NAME en $MOUNT_POINT"
s3fs "$BUCKET_NAME" "$MOUNT_POINT" -o iam_role="auto" -o allow_other -o mp_umask=0022 -o multireq_max=5

# Verificar si el montaje fue exitoso
if [ $? -eq 0 ]; then
    echo "El bucket S3 se montó correctamente en $MOUNT_POINT"
else
    echo "Hubo un error al montar el bucket S3"
    exit 1
fi

# Crear un enlace simbólico al directorio web de Apache
sudo ln -s "$MOUNT_POINT" /var/www/html/s3