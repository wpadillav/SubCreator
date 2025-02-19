### **📌 ISSUE_TEMPLATE.md**
```md
---
name: "🐞 Reporte de Bug"
about: "Reporta un problema con SubCreator"
title: "[Bug] Breve descripción del problema"
labels: bug
assignees: ""

---

## 🐞 Descripción del problema
Explica el problema que encontraste en SubCreator. ¿Qué estabas tratando de hacer y qué salió mal?

## 📌 Pasos para reproducir
1. Ejecutar este comando:
   ```bash
   ./subcreator.sh <acción> <subdominio>
   ```
2. Describir lo que esperabas que ocurriera.
3. Indicar qué ocurrió en su lugar.
4. Adjuntar cualquier mensaje de error relevante.

## 📷 Capturas de pantalla o logs
Si es posible, agrega capturas de pantalla o logs del error.

## 💻 Información del sistema
- **Sistema Operativo:** (ej. Ubuntu 22.04)
- **Versión de Apache:** (`apache2 -v`)
- **Versión de Certbot:** (`certbot --version`)
- **Versión de MariaDB:** (`mariadb --version`)
- **Versión del script:** (`git log -1 --oneline`)

## 📌 Información adicional
Si hay algo más que debamos saber, agrégalo aquí.

---

---
name: "✨ Solicitud de Nueva Funcionalidad"
about: "Sugiere una mejora o nueva funcionalidad"
title: "[Feature] Breve descripción"
labels: enhancement
assignees: ""

---

## ✨ Descripción de la funcionalidad
Describe la mejora o nueva característica que te gustaría ver en SubCreator.

## 💡 ¿Por qué es útil?
Explica cómo esta mejora beneficiará a los usuarios del script.

## 📌 Posible implementación
Si tienes alguna idea de cómo se podría implementar, descríbela aquí.

## 📷 Ejemplos o referencias
Si es posible, proporciona ejemplos de proyectos similares o capturas de pantalla.

---

---
name: "🛠️ Soporte o Pregunta"
about: "Si necesitas ayuda o tienes dudas"
title: "[Help] Breve descripción de la duda"
labels: question
assignees: ""

---

## ❓ Pregunta o problema
Describe tu duda o el problema técnico que tienes con SubCreator.

## 💻 Información del sistema
- **Sistema Operativo:** (ej. Ubuntu 22.04)
- **Versión de Apache:** (`apache2 -v`)
- **Versión de Certbot:** (`certbot --version`)
- **Versión de MariaDB:** (`mariadb --version`)
- **Versión del script:** (`git log -1 --oneline`)

## 📌 Información adicional
Si hay algo más que debamos saber, agrégalo aquí.
```

---

### **📌 ¿Cómo agregarlo a tu repositorio?**
Ejecuta estos comandos en tu terminal:

```bash
mkdir -p .github
echo "<COPIA Y PEGA EL CONTENIDO AQUÍ>" > .github/ISSUE_TEMPLATE.md
git add .github/ISSUE_TEMPLATE.md
git commit -m "📌 Agregar plantilla de issues"
git push origin main
```