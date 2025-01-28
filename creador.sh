#!/bin/bash

# Este script ha sido probado en Ubuntu 22.04 con Apache2 y Certbot para manejar subdominios

# Asignación de parámetros
accion=$1  # Acción a realizar (crear, eliminar, listar, etc.)
subdominio=$2  # El subdominio a manejar
dominio="nombredeldominio"  # Nombre del dominio principal
SSLCertificateFile=/etc/letsencrypt/live/"nombredeldominio"/fullchain.pem  # Ruta del certificado SSL
SSLCertificateKeyFile=/etc/letsencrypt/live/"nombredeldominio"/privkey.pem  # Ruta de la clave privada SSL

# Definición de las acciones a realizar dependiendo del primer parámetro
case $accion in
    "crear")
        # Acción para crear un subdominio

        # Crear el directorio para el subdominio y copiar los archivos de un proyecto base
        mkdir /var/www/$subdominio
        cp -R /var/www/proyecto_base/* /var/www/$subdominio

        # Asignar los permisos correctos para el directorio
        chown -R www-data:www-data /var/www/$subdominio
        chmod -R 775 /var/www/$subdominio

        # Crear archivo de configuración para Apache en /etc/apache2/sites-available
        echo "Creando archivo de configuracion https para el subdominio $subdominio \n"
        echo "<VirtualHost *:80>" > /etc/apache2/sites-available/$subdominio.$dominio.conf
        echo "    ServerName $subdominio.$dominio" >> /etc/apache2/sites-available/$subdominio.$dominio.conf
        echo "    Redirect permanent / https://$subdominio.$dominio/" >> /etc/apache2/sites-available/$subdominio.$dominio.conf
        echo "</VirtualHost>" >> /etc/apache2/sites-available/$subdominio.$dominio.conf

        # Configuración del VirtualHost en HTTPS (puerto 443)
        echo "<VirtualHost *:443>" >> /etc/apache2/sites-available/$subdominio.$dominio.conf
        echo "    ServerName $subdominio.$dominio" >> /etc/apache2/sites-available/$subdominio.$dominio.conf
        echo "    DocumentRoot /var/www/$subdominio" >> /etc/apache2/sites-available/$subdominio.$dominio.conf
        echo "    <Directory /var/www/$subdominio>" >> /etc/apache2/sites-available/$subdominio.$dominio.conf
        echo "        Options -Indexes +FollowSymLinks" >> /etc/apache2/sites-available/$subdominio.$dominio.conf
        echo "        AllowOverride All" >> /etc/apache2/sites-available/$subdominio.$dominio.conf
        echo "        Require all granted" >> /etc/apache2/sites-available/$subdominio.$dominio.conf
        echo "    </Directory>" >> /etc/apache2/sites-available/$subdominio.$dominio.conf
        echo "    ErrorLog ${APACHE_LOG_DIR}/$subdominio_error.log" >> /etc/apache2/sites-available/$subdominio.$dominio.conf
        echo "    CustomLog ${APACHE_LOG_DIR}/$subdominio_access.log combined" >> /etc/apache2/sites-available/$subdominio.$dominio.conf
        echo "    ErrorDocument 404 /assets/404.html" >> /etc/apache2/sites-available/$subdominio.$dominio.conf
        echo "    SSLEngine on" >> /etc/apache2/sites-available/$subdominio.$dominio.conf
        echo "    SSLCertificateFile $SSLCertificateFile" >> /etc/apache2/sites-available/$subdominio.$dominio.conf
        echo "    SSLCertificateKeyFile $SSLCertificateKeyFile" >> /etc/apache2/sites-available/$subdominio.$dominio.conf
        echo "    SSLProtocol all -SSLv3 -TLSv1 -TLSv1.1" >> /etc/apache2/sites-available/$subdominio.$dominio.conf
        echo "    SSLCipherSuite HIGH:!aNULL:!MD5" >> /etc/apache2/sites-available/$subdominio.$dominio.conf
        echo "</VirtualHost>" >> /etc/apache2/sites-available/$subdominio.$dominio.conf

        # Habilitar el sitio de Apache para el subdominio y recargar Apache
        a2ensite $subdominio.$dominio.conf
        systemctl reload apache2

        echo "Subdominio $subdominio.$dominio creado correctamente. ¡Pruebalo!"
        ;;

    "eliminar")
        # Acción para eliminar un subdominio

        # Deshabilitar el sitio de Apache y recargar el servicio
        a2dissite $subdominio.$dominio.conf
        systemctl reload apache2

        # Eliminar el directorio del subdominio y el archivo de configuración de Apache
        rm -rf /var/www/$subdominio
        rm /etc/apache2/sites-available/$subdominio.$dominio.conf

        echo "El subdominio $subdominio.$dominio ha sido eliminado"
        ;;

    "listar_creados")
        # Acción para listar todos los subdominios creados (configuración de Apache)
        ls -1 /etc/apache2/sites-available/*.$dominio.conf | xargs -n1 basename | sed 's/\.conf$//'
        ;;

    "listar_activos")
        # Acción para listar los subdominios activos (habilitados) en Apache
        ls -1 /etc/apache2/sites-enabled/*.$dominio.conf | xargs -n1 basename | sed 's/\.conf$//'
        ;;

    "activar")
        # Acción para activar un subdominio (habilitar el sitio en Apache)
        a2ensite $subdominio.$dominio.conf
        systemctl reload apache2
        echo "El subdominio $subdominio.$dominio ha sido activado"
        ;;

    "desactivar")
        # Acción para desactivar un subdominio (deshabilitar el sitio en Apache)
        a2dissite $subdominio.$dominio.conf
        systemctl reload apache2
        echo "El subdominio $subdominio.$dominio ha sido desactivado"
        ;;

    "verificar")
        # Acción para verificar si el subdominio está activo
        if [ -f /etc/apache2/sites-available/$subdominio.$dominio.conf ]; then
            echo "true"
        else
            echo "false"
        fi
        ;;

    "crear_db")
        # Acción para crear una base de datos para el subdominio

        # Crear un volcado de la base de datos base y restaurarla en una nueva base de datos para el subdominio
        mariadb-dump -u user_db -p'password_user_db' db_base > /var/www/$subdominio/db_base.sql
        mariadb -u user_db -e "CREATE DATABASE $subdominio"
        mariadb -u user_db $subdominio < /var/www/$subdominio/db_base.sql

        # Conceder privilegios al usuario en la nueva base de datos
        mariadb -u user_db -e "GRANT ALL PRIVILEGES ON $subdominio.* TO 'user_db'@'localhost'"
        mariadb -u user_db -e "FLUSH PRIVILEGES"

        # Eliminar el archivo SQL temporal
        rm /var/www/$subdominio/db_base.sql
        echo "La base de datos $subdominio ha sido creada y restaurada"
        ;;

    *)
        # Acción por defecto cuando no se reconoce el parámetro
        echo "Acción no válida"
        ;;
esac
