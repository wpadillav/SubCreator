# 🚀 **SubCreator V.2**

[![GitHub Workflow Status](https://github.com/wpadillav/SubCreator/actions/workflows/test.yml/badge.svg)](https://github.com/wpadillav/SubCreator/actions)
[![ShellCheck](https://img.shields.io/badge/ShellCheck-Passing-green)](https://www.shellcheck.net/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

**SubCreator** es una herramienta automatizada para la gestión de subdominios en servidores Apache, con integración de **Certbot** para la generación y renovación de certificados SSL.  

Este script permite **crear, eliminar, activar, desactivar, listar y verificar subdominios** de manera sencilla y rápida.

---

## 🔥 **¿Tienes un problema o sugerencia?**
📌 **[Reportar un bug](https://github.com/wpadillav/SubCreator/issues/new?template=bug_report.md)**  
📌 **[Sugerir una mejora](https://github.com/wpadillav/SubCreator/issues/new?template=feature_request.md)**  
📌 **[Solicitar ayuda](https://github.com/wpadillav/SubCreator/issues/new?template=help_request.md)**  

---

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
### 🔹 **1️⃣ Instalar Dependencias**
Ejecuta el siguiente comando para instalar todo lo necesario:

```bash
sudo apt update && sudo apt install -y apache2 certbot python3-certbot-apache mariadb-server
```

### 🔹 **2️⃣ Clonar el repositorio**
```bash
git clone https://github.com/wpadillav/SubCreator.git
cd SubCreator
```

### 🔹 **3️⃣ Configurar el script**
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

### 🔹 **4️⃣ Conceder permisos de ejecución**
```bash
chmod +x subcreator.sh
```

---

## 📌 **Uso del script**
### 🛠 **Comandos principales**
✔️ **Crear un subdominio**  
```bash
./subcreator.sh crear mi-subdominio
```
✔️ **Eliminar un subdominio**  
```bash
./subcreator.sh eliminar mi-subdominio
```
✔️ **Listar subdominios creados**  
```bash
./subcreator.sh listar_creados
```
✔️ **Listar subdominios activos**  
```bash
./subcreator.sh listar_activos
```
✔️ **Verificar si un subdominio existe**  
```bash
./subcreator.sh verificar mi-subdominio
```
✔️ **Activar un subdominio**  
```bash
./subcreator.sh activar mi-subdominio
```
✔️ **Desactivar un subdominio**  
```bash
./subcreator.sh desactivar mi-subdominio
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
📌 Soporte para Nginx  
📌 Opción para restaurar subdominios eliminados  
📌 Gestión avanzada de bases de datos  

---

## 🤝 **Contribuciones**
📢 **¡Cualquier ayuda es bienvenida!**  
Si deseas contribuir, revisa nuestras [Guías de Contribución](CONTRIBUTING.md) y abre un **Pull Request**.

📌 **¿Encontraste un bug?** 👉 [Reportarlo aquí](https://github.com/wpadillav/SubCreator/issues/new?template=bug_report.md)  
📌 **¿Tienes una idea?** 👉 [Sugerir una mejora](https://github.com/wpadillav/SubCreator/issues/new?template=feature_request.md)  

---

## 📜 **Licencia**
Este proyecto está licenciado bajo **MIT License**. Consulta el archivo [`LICENSE`](LICENSE) para más información.

---

🔥 **SubCreator** te ayuda a automatizar la gestión de subdominios en tu servidor con solo un comando. ¡Ahorra tiempo y simplifica tu administración web! 🚀
```

---

## **📌 ¿Qué mejoramos en este README?**
✅ **Badges** en la parte superior para mostrar estado del proyecto.  
✅ **Sección de "¿Tienes un problema o sugerencia?"** con enlaces directos a Issues.  
✅ **Comandos de instalación más eficientes** (`&&` para unir en un solo paso).  
✅ **Mejor estructura y formato** para una lectura más fluida.  
✅ **Mejor organización de comandos** en la sección de uso.  

---

### **🚀 Próximo paso**
Para actualizar el `README.md` en tu repositorio, haz lo siguiente:

```bash
echo "<COPIA Y PEGA EL CONTENIDO AQUÍ>" > README.md
git add README.md
git commit -m "📝 Mejorar README con badges y enlaces a Issues"
git push origin main
```