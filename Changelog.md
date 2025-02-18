## 📝 **Changelog - creador.sh v1 → v2**

### **Mejoras y cambios introducidos en la versión 2:**
1. **Verificación de permisos**:
   - Se agregó una validación para asegurarse de que el script se ejecute como `root`. Si el usuario no tiene permisos de superusuario, el script se detiene con un mensaje de error.

2. **Instrucciones de uso**:
   - Se añadieron comentarios con ejemplos de cómo usar el script para crear, eliminar, listar, activar, desactivar y verificar subdominios.

3. **Mejoras en la seguridad y validación**:
   - Se mejoró la validación del nombre del subdominio para asegurarse de que solo contenga caracteres permitidos (`^[a-zA-Z0-9_-]+$`).
   - Se genera automáticamente una contraseña aleatoria de 15 caracteres para la base de datos en lugar de usar una estática.

4. **Variables más flexibles**:
   - El dominio ya no está codificado directamente en la ruta de los certificados SSL, ahora usa `SSLCertificateFile` y `SSLCertificateKeyFile` con el valor de `$dominio` dinámicamente.

5. **Optimización de eliminación de archivos**:
   - Se mejora la limpieza de directorios dentro de `files/` cuando se crea un subdominio.
   - Antes de eliminar un subdominio, se hace una copia de seguridad en un archivo `.tar.gz`.

6. **Mejoras en la gestión de bases de datos**:
   - Se crean bases de datos con usuarios únicos por subdominio en lugar de reutilizar credenciales.
   - Se eliminan las bases de datos y los usuarios asociados correctamente al eliminar un subdominio.

---
