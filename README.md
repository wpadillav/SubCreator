# **SubCreator V.2**

**SubCreator** es una herramienta automatizada para la gestión de subdominios en servidores Apache, con integración de **Certbot** para la generación y renovación de certificados SSL. Este script permite **crear, eliminar, activar, desactivar, listar y verificar subdominios** de manera sencilla y rápida.

## 🌟 **Características**
✅ Creación y eliminación automática de subdominios  
✅ Integración con **Apache** y configuración automática de **VirtualHost**  
✅ Soporte para **SSL/TLS** con **Let's Encrypt (Certbot)**  
✅ Creación y gestión de bases de datos para cada subdominio  
✅ Validaciones de seguridad y manejo de errores  

---

## 📌 **Requisitos**
Este script ha sido probado en **Ubuntu 22.04** y requiere los siguientes componentes:

- **Ubuntu 22.04** o superior
- **Apache2** (servidor web)
- **Certbot** (para la gestión de certificados SSL)
- **MariaDB/MySQL** (para la gestión de bases de datos)

---

## 🚀 **Instalación**

### 1️⃣ Instalar Apache2
Si aún no tienes Apache instalado, ejecútalo en la terminal:

```bash
sudo apt update
sudo apt install apache2
```

### 2️⃣ Instalar Certbot
Certbot se encarga de generar y renovar los certificados SSL:

```bash
sudo apt install certbot python3-certbot-apache
```

### 3️⃣ Instalar MariaDB (Opcional, si necesitas bases de datos)
Si deseas manejar bases de datos para cada subdominio:

```bash
sudo apt install mariadb-server
sudo mysql_secure_installation
```

### 4️⃣ Clonar el repositorio
Descarga el proyecto desde GitHub y accede al directorio:

```bash
git clone https://github.com/tu-usuario/SubCreator.git
cd SubCreator
```

### 5️⃣ Configurar el script
Edita el script `subcreator.sh` y personaliza las siguientes líneas con tu dominio:

```bash
nano subcreator.sh
```

Modifica:

```bash
dominio="tudominio.com"
SSLCertificateFile="/etc/letsencrypt/live/tudominio.com/fullchain.pem"
SSLCertificateKeyFile="/etc/letsencrypt/live/tudominio.com/privkey.pem"
```

### 6️⃣ Conceder permisos de ejecución
Haz que el script sea ejecutable:

```bash
chmod +x subcreator.sh
```

---

## 📌 **Uso del script**
El script permite ejecutar diferentes acciones para administrar subdominios en tu servidor.

### 🔹 **Crear un subdominio**
Este comando crea un nuevo subdominio, configura Apache y habilita SSL:

```bash
./subcreator.sh crear subdominio
```

### 🔹 **Eliminar un subdominio**
Elimina el subdominio, su configuración en Apache y la base de datos (si existe):

```bash
./subcreator.sh eliminar subdominio
```

### 🔹 **Listar subdominios creados**
Muestra todos los subdominios que tienen configuración en Apache:

```bash
./subcreator.sh listar_creados
```

### 🔹 **Listar subdominios activos**
Muestra solo los subdominios que están habilitados actualmente en Apache:

```bash
./subcreator.sh listar_activos
```

### 🔹 **Verificar si un subdominio existe**
Comprueba si un subdominio está configurado en Apache:

```bash
./subcreator.sh verificar subdominio
```

### 🔹 **Activar un subdominio**
Habilita un subdominio en Apache sin necesidad de volver a configurarlo:

```bash
./subcreator.sh activar subdominio
```

### 🔹 **Desactivar un subdominio**
Deshabilita un subdominio sin eliminar su configuración:

```bash
./subcreator.sh desactivar subdominio
```

### 🔹 **Crear una base de datos para un subdominio**
Genera una base de datos con un usuario exclusivo para el subdominio:

```bash
./subcreator.sh crear_db subdominio
```

ℹ️ **Nota:** La base de datos se creará con un nombre y usuario basado en el subdominio.

---

## 🛠️ **Mantenimiento y Renovación de SSL**
Certbot renueva los certificados automáticamente, pero puedes forzar la renovación con:

```bash
sudo certbot renew --dry-run
```

Si deseas verificar la validez del certificado:

```bash
sudo certbot certificates
```

---

## 💡 **Mejoras Futuras**
- Soporte para Nginx  
- Opción para restaurar subdominios eliminados  
- Gestión avanzada de bases de datos  

---

## 🤝 **Contribuciones**
¡Este proyecto está abierto a mejoras! Si deseas contribuir, puedes:

- Abrir un **issue** con una sugerencia o bug
- Enviar un **pull request** con mejoras en el código o documentación
- Compartir esta herramienta con la comunidad 🚀

---

## 📜 **Licencia**
Este proyecto está licenciado bajo **MIT License**. Consulta el archivo `LICENSE` para más información.

---

🔥 **SubCreator** te ayuda a automatizar la gestión de subdominios en tu servidor con solo un comando. ¡Ahorra tiempo y simplifica tu administración web! 🚀
