# Formulario Web con Jakarta EE

Aplicación web para manejo de formularios utilizando Jakarta EE 9.0.0.

## Características

- Registro de usuarios con validación de campos
- Selección de país, lenguajes de programación y roles
- Preferencias de idioma (Español, Inglés, Francés)
- Validación de formularios en el servidor

## Tecnologías

- Java 16
- Jakarta EE 9.0.0
- Servlet API
- JSP
- Maven
- Tomcat

## Configuración

1. Clonar el repositorio
2. Configurar `pom.xml` con tus credenciales de Tomcat
3. Ejecutar con Maven: `mvn tomcat7:run`

## Estructura del proyecto

- `src/main/java/`: Código fuente Java
  - `FormServlet.java`: Procesa los datos del formulario
  - `FormValidator.java`: Validación de los datos
- `src/main/webapp/`: Archivos web
  - `index.jsp`: Formulario principal

## Contribución

1. Haz fork del proyecto
2. Crea una rama (`git checkout -b feature/nueva-funcionalidad`)
3. Haz commit de tus cambios (`git commit -m 'Añade nueva funcionalidad'`)
4. Haz push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Abre un Pull Request
