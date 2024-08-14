#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2 php libapache2-mod-php
sudo systemctl enable apache2
sudo systemctl start apache2
# Iniciar Apache y configurarlo para que se inicie automáticamente en cada reinicio
systemctl start httpd
systemctl enable httpd

# Configurar los permisos correctos para el directorio web
chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html

# Reiniciar Apache para aplicar los cambios
systemctl restart httpd

echo "Apache y PHP han sido instalados y configurados correctamente."
