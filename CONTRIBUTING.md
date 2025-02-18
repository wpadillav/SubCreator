# **Guía de Contribución a SubCreator** 🛠️

¡Gracias por tu interés en contribuir a **SubCreator**! 🎉  
Las contribuciones de la comunidad son esenciales para mejorar este proyecto, ya sea con código, documentación o reporte de errores.

---

## 📌 **Formas de Contribuir**

### 🐞 1. **Reportar un problema o bug**
Si encuentras un error o tienes una sugerencia para mejorar **SubCreator**, abre un **issue** en el repositorio oficial:  
🔗 [https://github.com/wpadillav/SubCreator/issues](https://github.com/wpadillav/SubCreator/issues)

Al reportar un problema, incluye la siguiente información:
- ✅ **Descripción clara** del problema o mejora.
- 📌 **Pasos para reproducir el error** (en caso de ser un bug).
- 📄 **Mensajes de error o logs** relevantes.
- 💻 **Detalles del entorno** (SO, versión de Apache, Certbot, etc.).

Si tienes una idea para mejorar el script, también puedes abrir un **issue** con la etiqueta `enhancement` para discutirlo con la comunidad.

---

### 📖 2. **Mejorar la documentación**
Si notas errores en la documentación o crees que hay algo que puede explicarse mejor, ¡nos encantaría tu ayuda! Puedes contribuir mejorando el **README.md**, **CONTRIBUTING.md** o cualquier otro archivo de documentación.

Para ello:
1. **Haz un fork del repositorio** (ver instrucciones más abajo).
2. Edita los archivos necesarios.
3. Crea un **pull request** con una descripción clara de los cambios.

---

### 💻 3. **Contribuir con código**
Si quieres mejorar el código de **SubCreator**, sigue estos pasos:

#### 🔄 **1. Haz un fork del repositorio**
Crea una copia del proyecto en tu cuenta de GitHub haciendo **fork** del repositorio.

#### 🌱 **2. Crea una nueva rama para tu contribución**
Usa una nomenclatura clara para la rama, como:

```bash
git checkout -b feature/nueva-funcionalidad
```
O, si es una corrección de error:

```bash
git checkout -b fix/correccion-de-bug
```

#### ⚙️ **3. Realiza los cambios y prueba el código**
- Asegúrate de que tu código no rompe la funcionalidad existente.
- Verifica que las modificaciones sean compatibles con **Ubuntu 22.04+**.
- Documenta los cambios con comentarios claros dentro del script.

#### ✅ **4. Confirma y sube los cambios a tu repositorio**
```bash
git add .
git commit -m "Añadida nueva funcionalidad: [descripción breve]"
git push origin feature/nueva-funcionalidad
```

#### 🔀 **5. Crea un Pull Request (PR)**
- Ve a **[Pull Requests](https://github.com/wpadillav/SubCreator/pulls)** en el repositorio oficial.
- Crea un **PR** desde tu rama (`feature/nueva-funcionalidad`) hacia la rama `main` del proyecto.
- Explica claramente **qué problema soluciona o qué funcionalidad agrega**.
- Si el PR está relacionado con un **issue**, menciona el número (`Closes #123`).

---

## 🎯 **Guía de estilo y mejores prácticas**
Para mantener un código limpio y uniforme, sigue estas recomendaciones:

1. **Usa nombres de variables claros** y significativos (`ruta_subdominio` en lugar de `rsd`).
2. **Mantén los archivos organizados** y evita código redundante.
3. **Añade comentarios** cuando sea necesario, especialmente en funciones complejas.
4. **Evita subir archivos innecesarios**, como logs o archivos temporales.
5. **Realiza pruebas** antes de enviar un PR para asegurarte de que el código funciona correctamente.

---

## 🎉 **¡Gracias por contribuir!**
Cada aportación, por pequeña que sea, ayuda a mejorar **SubCreator** y beneficia a toda la comunidad.  
Si tienes dudas o necesitas ayuda, no dudes en abrir un **issue** o contactar con nosotros en [GitHub Discussions](https://github.com/wpadillav/SubCreator/discussions).

🚀 **¡Felices contribuciones!** 🚀