# Explicación:

El archivo template.yaml define toda la infraestructura usando CloudFormation en lugar de Terraform. Incluye todos los recursos que teníamos antes: VPC, subnet, Internet Gateway, EC2 instance, S3 bucket, y DynamoDB table.
El workflow de despliegue (deploy.yml) ahora usa el comando aws cloudformation deploy para crear o actualizar el stack de CloudFormation.
El nuevo workflow de eliminación (delete.yml) usa workflow_dispatch, lo que significa que se puede activar manualmente desde la interfaz de GitHub. Utiliza el comando aws cloudformation delete-stack para eliminar todo el stack de CloudFormation, eliminando así toda la infraestructura creada.

# Para usar este setup:

Sube estos cambios a tu repositorio de GitHub.
Para desplegar, haz un push a la rama main como antes.
Para eliminar la infraestructura, ve a la pestaña "Actions" en tu repositorio de GitHub, selecciona el workflow "Delete AWS Infrastructure" y haz clic en "Run workflow".

Este enfoque proporciona una manera fácil de desplegar y eliminar toda la infraestructura con un solo clic, mientras mantiene el proceso de eliminación como una acción manual para evitar eliminaciones accidentales.

