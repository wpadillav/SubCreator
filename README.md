# SubCreator

**SubCreator** es una herramienta automatizada para gestionar subdominios en un servidor Apache, con soporte para certificados SSL a través de **Certbot**. Permite crear, eliminar, activar, desactivar, listar y verificar subdominios de manera eficiente desde un sencillo script.

## Requisitos

Este proyecto ha sido probado en **Ubuntu 22.04** y requiere tener los siguientes componentes instalados:

- **Ubuntu 22.04** o superior
- **Apache2** (servidor web)
- **Certbot** (para la gestión de certificados SSL)

## Instalación

1. **Instalar Apache2:**

   Si no tienes Apache2 instalado, puedes hacerlo con el siguiente comando:

   ```bash
   sudo apt update
   sudo apt install apache2
   ```

2. **Instalar Certbot:**

   Certbot se utiliza para obtener y renovar certificados SSL. Instálalo con:

   ```bash
   sudo apt install certbot python3-certbot-apache
   ```

3. **Clonar el repositorio:**

   Clona el proyecto desde GitHub en tu servidor:

   ```bash
   git clone https://github.com/tu-usuario/SubCreator.git
   cd SubCreator
   ```

4. **Configurar el script:**

   Asegúrate de modificar el script con el nombre de tu dominio principal y las rutas correspondientes al certificado SSL. Edita el archivo `subcreator.sh` con un editor de texto (como `nano` o `vim`):

   ```bash
   nano subcreator.sh
   ```

   Cambia las siguientes líneas:

   ```bash
   dominio="tudominio.com"
   SSLCertificateFile=/etc/letsencrypt/live/tudominio.com/fullchain.pem
   SSLCertificateKeyFile=/etc/letsencrypt/live/tudominio.com/privkey.pem
   ```

5. **Conceder permisos de ejecución:**

   Haz que el script sea ejecutable:

   ```bash
   chmod +x subcreator.sh
   ```

## Uso

El script permite realizar diversas acciones con los subdominios a través de comandos. Los parámetros que se pueden pasar son:

1. **Crear un subdominio:**

   Para crear un nuevo subdominio, utiliza el comando `crear` seguido del nombre del subdominio:

   ```bash
   ./subcreator.sh crear subdominio
   ```

2. **Eliminar un subdominio:**

   Para eliminar un subdominio, usa el comando `eliminar`:

   ```bash
   ./subcreator.sh eliminar subdominio
   ```

3. **Listar subdominios creados:**

   Para listar todos los subdominios creados en el sistema, ejecuta:

   ```bash
   ./subcreator.sh listar_creados
   ```

4. **Verificar si un subdominio está activo:**

   Para verificar si un subdominio está configurado y activo, usa:

   ```bash
   ./subcreator.sh verificar subdominio
   ```

5. **Activar o desactivar un subdominio:**

   Para activar un subdominio (habilitar en Apache):

   ```bash
   ./subcreator.sh activar subdominio
   ```

   Para desactivar un subdominio:

   ```bash
   ./subcreator.sh desactivar subdominio
   ```

6. **Crear base de datos para el subdominio:**

   Si necesitas una base de datos específica para tu subdominio, puedes crearla con:

   ```bash
   ./subcreator.sh crear_db subdominio
   ```

## Contribuciones

Si deseas contribuir a este proyecto, por favor abre un **issue** o envía un **pull request**. Asegúrate de seguir las mejores prácticas de código y documentación.

## Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo `LICENSE` para más detalles.

---
