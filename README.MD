# Proyecto de Infraestructura AWS

Este proyecto despliega una infraestructura en AWS que incluye una VPC, una instancia EC2, un bucket S3, una tabla DynamoDB y una página PHP "Hola Mundo".

## Componentes

- VPC con una subred pública
- Instancia EC2 t2.micro con Apache
- Bucket S3 para almacenar la página web
- Tabla DynamoDB
- Página PHP "Hola Mundo"

## Despliegue

El despliegue se realiza mediante GitHub Actions. Para iniciar el despliegue:

1. Pestaña "Actions" en el repositorio de GitHub.
2. Seleccionar el flujo de trabajo "Deploy Infrastructure".
3. Clic en "Run workflow".
4. Esperar la aprobación manual y luego confirmar el despliegue.

## Acceso a la página web

Una vez desplegada la infraestructura, se puede acceder a la página web utilizando la URL proporcionada en la salida de CloudFormation. Esta URL será la dirección DNS pública de la instancia EC2.

## Eliminación de la infraestructura

Para eliminar la infraestructura:

1. Pestaña "Actions" en el repositorio de GitHub.
2. Seleccionar el flujo de trabajo "Delete Infrastructure".
3. Clic en "Run workflow".
4. Esperar la aprobación manual y luego confirma la eliminación.
