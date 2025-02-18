#!/bin/bash

# Instrucciones de uso
# - Crear un subdominio: bash creador.sh crear subdominio
# - Eliminar un subdominio: bash creador.sh eliminar subdominio
# - Listar subdominios creados: bash creador.sh listar_creados
# - Listar subdominios activos: bash creador.sh listar_activos
# - Activar un subdominio: bash creador.sh activar subdominio
# - Desactivar un subdominio: bash creador.sh desactivar subdominio
# - Verificar si un subdominio existe: bash creador.sh verificar subdominio

# Definición de variables
accion=$1  # Acción a ejecutar (crear, eliminar, listar, etc.)
subdominio=$2  # Nombre del subdominio
dominio="nombre_domain.com"  # Nombre del dominio principal
ruta_subdominio="/var/www/$subdominio"  # Ruta donde se almacenará el subdominio
conf_file="/etc/apache2/sites-available/$subdominio.$dominio.conf"  # Archivo de configuración de Apache

# Generación de contraseña aleatoria para la base de datos
passdb=$(tr -dc 'a-zA-Z0-9' < /dev/urandom | fold -w 15 | head -n 1)


# Rutas de certificados SSL
SSLCertificateFile="/etc/letsencrypt/live/$dominio/fullchain.pem"
SSLCertificateKeyFile="/etc/letsencrypt/live/$dominio/privkey.pem"

# Validaciones previas para ciertas acciones
if [ "$accion" == "crear" ] || [ "$accion" == "eliminar" ] || [ "$accion" == "activar" ] || [ "$accion" == "desactivar" ]; then
    if [ -z "$subdominio" ]; then
        echo "Error: Falta el nombre del subdominio."
        exit 1
    fi
    # Validar el nombre del subdominio (solo permite letras, números, guiones y guiones bajos)
    if [[ ! "$subdominio" =~ ^[a-zA-Z0-9_-]+$ ]]; then
        echo "Error: Nombre de subdominio inválido."
        exit 1
    fi
fi

# Manejo de acciones
case $accion in
    "crear")
        # Verificar si el subdominio ya existe
        if [ -d "$ruta_subdominio" ]; then
            echo "Error: El subdominio ya existe."
            exit 1
        fi

        # Crear directorio del subdominio y copiar archivos base
        mkdir "$ruta_subdominio"
        cp -R /var/www/demo/* "$ruta_subdominio"

        # Limpiar archivos innecesarios en los directorios especificados
        for dir in data_files adicionales conformidades_firmados conformidades_originales \
                   files_consumidores documentos_firmados documentos_originales informes manuales temp; do
            rm -rf "$ruta_subdominio/files/$dir/*"
        done

        # Establecer permisos y propietario adecuados
        chown -R www-data:www-data "$ruta_subdominio"
        chmod -R 774 "$ruta_subdominio"

        # Crear configuración de Apache para el subdominio
        cat <<EOF > "$conf_file"
<VirtualHost *:80>
    ServerName $subdominio.$dominio
    Redirect permanent / https://$subdominio.$dominio/
</VirtualHost>

<VirtualHost *:443>
    ServerName $subdominio.$dominio
    DocumentRoot $ruta_subdominio

    <Directory $ruta_subdominio>
        Options -Indexes +FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/${subdominio}_error.log
    CustomLog \${APACHE_LOG_DIR}/${subdominio}_access.log combined


    SSLEngine on
    SSLCertificateFile $SSLCertificateFile
    SSLCertificateKeyFile $SSLCertificateKeyFile
    SSLProtocol all -SSLv3 -TLSv1 -TLSv1.1
    SSLCipherSuite HIGH:!aNULL:!MD5
</VirtualHost>
EOF

        # Habilitar el sitio en Apache y reiniciar el servicio
        a2ensite "$subdominio.$dominio.conf"
        systemctl reload apache2

        # Crear la base de datos y el usuario asociado
        mariadb -u root -e "
            CREATE DATABASE $subdominio;
            CREATE USER '$subdominio'@'localhost' IDENTIFIED BY '$passdb';
            GRANT ALL PRIVILEGES ON $subdominio.* TO '$subdominio'@'localhost';
            FLUSH PRIVILEGES;
        "

        # Mostrar credenciales de la base de datos
        echo "Base de datos: $subdominio"
        echo "Usuario: $subdominio"
        echo "Contraseña: $passdb"
        echo "Ruta: $ruta_subdominio"
        echo "Subdominio $subdominio.$dominio creado correctamente."
        ;;

    "eliminar")
        # Verificar si el subdominio existe antes de eliminar
        if [ ! -d "$ruta_subdominio" ]; then
            echo "Error: El subdominio no existe."
            exit 1
        fi

        # Deshabilitar el sitio en Apache
        a2dissite "$subdominio.$dominio.conf"
        systemctl reload apache2

        # Crear una copia de seguridad de la base de datos antes de eliminarla
        mariadb-dump -u root "$subdominio" > "$ruta_subdominio/$subdominio.sql"

        # Copiar el archivo de configuración antes de eliminarlo
        cp "$conf_file" "$ruta_subdominio"

        # Comprimir el contenido del subdominio antes de eliminarlo
        tar --exclude="$ruta_subdominio.tar.gz" -czf "$ruta_subdominio.tar.gz" -C /var/www "$subdominio"

        # Eliminar directorio y archivo de configuración
        rm -rf "$ruta_subdominio"
        rm "$conf_file"

        # Eliminar la base de datos y el usuario asociado
        mariadb -u root -e "
            DROP DATABASE $subdominio;
            DROP USER '$subdominio'@'localhost';
            FLUSH PRIVILEGES;
        "

        echo "El subdominio $subdominio.$dominio ha sido eliminado correctamente."
        ;;

    "listar_creados")
        find /etc/apache2/sites-available/ -name "*.conf" -print0 | xargs -0 -n1 basename | sed 's/\.conf$//'
        ;;

    "listar_activos")
        find /etc/apache2/sites-enabled/ -name "*.conf" -print0 | xargs -0 -n1 basename | sed 's/\.conf$//'
        ;;

    "activar")
        a2ensite "$subdominio.$dominio.conf"
        systemctl reload apache2
        echo "El subdominio $subdominio.$dominio ha sido activado."
        ;;

    "desactivar")
        a2dissite "$subdominio.$dominio.conf"
        systemctl reload apache2
        echo "El subdominio $subdominio.$dominio ha sido desactivado."
        ;;

    "verificar")
        if [ -f "/etc/apache2/sites-available/$subdominio.$dominio.conf" ]; then
            echo "true"
        else
            echo "false"
        fi
        ;;

    *)
        echo "Acción no válida."
        exit 1
        ;;
esac