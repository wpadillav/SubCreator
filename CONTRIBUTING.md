```md
# **Guía de Contribución a SubCreator** 🛠️  

¡Gracias por tu interés en contribuir a **SubCreator**! 🎉  
Las contribuciones de la comunidad son esenciales para mejorar este proyecto, ya sea con código, documentación o reporte de errores.  

---

## 📌 **Formas de Contribuir**  

### 🐞 1. **Reportar un problema o bug**  
Si encuentras un error o tienes una sugerencia para mejorar **SubCreator**, abre un **issue** en el repositorio oficial:  
🔗 **[Abrir un Issue](https://github.com/wpadillav/SubCreator/issues/new/choose)**  

Al reportar un problema, incluye la siguiente información:  
✔️ **Descripción clara** del problema o mejora.  
📌 **Pasos para reproducir el error** (en caso de ser un bug).  
📄 **Mensajes de error o logs** relevantes.  
💻 **Detalles del entorno** (SO, versión de Apache, Certbot, etc.).  

Si tienes una idea para mejorar el script, también puedes abrir un **issue** con la etiqueta `enhancement` para discutirlo con la comunidad.  

---

### 📖 2. **Mejorar la documentación**  
Si notas errores en la documentación o crees que hay algo que puede explicarse mejor, ¡nos encantaría tu ayuda! Puedes contribuir mejorando los archivos:  

- 📜 **[README.md](README.md)** (Documentación principal).  
- 📜 **[CONTRIBUTING.md](CONTRIBUTING.md)** (Guía de contribución).  
- 📜 **[ISSUE_TEMPLATE.md](.github/ISSUE_TEMPLATE.md)** (Plantilla de Issues).  

#### ✅ **Pasos para mejorar la documentación:**  
1️⃣ **Haz un fork del repositorio** (ver instrucciones abajo).  
2️⃣ **Edita los archivos necesarios** y agrega información clara.  
3️⃣ **Crea un pull request (PR)** con una descripción de los cambios.  

---

### 💻 3. **Contribuir con código**  
Si quieres mejorar el código de **SubCreator**, sigue estos pasos:  

#### 🔄 **1. Haz un fork del repositorio**  
Crea una copia del proyecto en tu cuenta de GitHub haciendo **fork** del repositorio.  
🔗 **[Hacer Fork](https://github.com/wpadillav/SubCreator/fork)**  

#### 🌱 **2. Crea una nueva rama para tu contribución**  
Usa una nomenclatura clara para la rama:  

```bash
git checkout -b feature/nueva-funcionalidad
```
O, si es una corrección de error:  

```bash
git checkout -b fix/correccion-de-bug
```

#### ⚙️ **3. Realiza los cambios y prueba el código**  
✔️ Asegúrate de que tu código no rompe la funcionalidad existente.  
✔️ Verifica que las modificaciones sean compatibles con **Ubuntu 22.04+**.  
✔️ Documenta los cambios con comentarios claros dentro del script.  

#### ✅ **4. Confirma y sube los cambios a tu repositorio**  
```bash
git add .
git commit -m "✨ Añadida nueva funcionalidad: [descripción breve]"
git push origin feature/nueva-funcionalidad
```

#### 🔀 **5. Crea un Pull Request (PR)**  
🔗 **[Crear un Pull Request](https://github.com/wpadillav/SubCreator/compare)**  

- Asegúrate de que tu PR esté dirigido a la rama `main`.  
- Explica claramente **qué problema soluciona o qué funcionalidad agrega**.  
- Si el PR está relacionado con un **issue**, menciona el número (`Closes #123`).  
- Espera la revisión y posibles sugerencias antes de su aprobación.  

---

## 🎯 **Guía de estilo y mejores prácticas**  
Para mantener un código limpio y uniforme, sigue estas recomendaciones:  

✔️ **Usa nombres de variables claros** (`ruta_subdominio` en lugar de `rsd`).  
📂 **Mantén los archivos organizados** y evita código redundante.  
📝 **Añade comentarios** cuando sea necesario, especialmente en funciones complejas.  
🚫 **Evita subir archivos innecesarios**, como logs o archivos temporales.  
🧪 **Realiza pruebas** antes de enviar un PR para asegurarte de que el código funciona correctamente.  

---

## ✅ **Verificación y pruebas antes de enviar un PR**  
Antes de hacer un PR, verifica que todo esté en orden:  

✔️ **Revisar sintaxis con `shellcheck`**  
```bash
shellcheck subcreator.sh
```
✔️ **Ejecutar pruebas automatizadas con `bats`**  
```bash
bats tests/test_subcreator.bats
```
✔️ **Revisar cambios antes de confirmar**  
```bash
git diff
```

---

## 🎉 **¡Gracias por contribuir!**  
Cada aportación, por pequeña que sea, ayuda a mejorar **SubCreator** y beneficia a toda la comunidad.  

📢 **Si tienes dudas o necesitas ayuda, no dudes en abrir un [Issue de Soporte](https://github.com/wpadillav/SubCreator/issues/new?template=help_request.md) o participar en [GitHub Discussions](https://github.com/wpadillav/SubCreator/discussions).**  

🚀 **¡Felices contribuciones!** 🚀  
```

---

## **📌 ¿Qué mejoramos en esta versión?**
✅ **Enlaces directos a Issues, Pull Requests y Forks** para facilitar la contribución.  
✅ **Formato más claro y organizado** con pasos numerados.  
✅ **Sección de "Verificación y pruebas"** antes de enviar un PR.  
✅ **Guía de estilo mejor explicada** para código limpio.  

---

### **🚀 Próximo paso**
Para actualizar tu `CONTRIBUTING.md`, haz lo siguiente en tu terminal:

```bash
echo "<COPIA Y PEGA EL CONTENIDO AQUÍ>" > CONTRIBUTING.md
git add CONTRIBUTING.md
git commit -m "📝 Mejorar guía de contribución"
git push origin main
```