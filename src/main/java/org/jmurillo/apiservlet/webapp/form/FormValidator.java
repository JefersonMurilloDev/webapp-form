package org.jmurillo.apiservlet.webapp.form;

import java.util.HashMap;
import java.util.Map;

public class FormValidator {
    private Map<String, String> errores;

    public FormValidator() {
        this.errores = new HashMap<>();
    }

    public void validarUsername(String username) {
        if (username == null || username.isBlank()) {
            errores.put("username", "El username es requerido!");
        }
    }

    public void validarPassword(String pass) {
        if (pass == null || pass.isBlank()) {
            errores.put("password", "El password no puede ser vacio!");
        }
    }

    public void validarEmail(String email) {
        if (email == null || !email.contains("@")) {
            errores.put("email", "El email es requerido y debe tener un formato de correo");
        }
    }

    public void validarPais(String pais) {
        if (pais == null || pais.isEmpty() || pais.equals(" ")) {
            errores.put("pais", "El pais es requerido!");
        }
    }

    public void validarLenguajes(String[] lenguajes) {
        if (lenguajes == null || lenguajes.length == 0) {
            errores.put("lenguajes", "Debe seleccionar al menos un lenguaje");
        }
    }

    public void validarRoles(String[] roles) {
        if (roles == null || roles.length == 0) {
            errores.put("roles", "Debe seleccionar al menos un rol");
        }
    }

    public void validarIdioma(String idioma) {
        if (idioma == null) {
            errores.put("idioma", "Debe seleccionar un idioma!");
        }
    }



    public Map<String, String> getErrores() {
        return errores;
    }


    public boolean hayErrores() {
        return errores.isEmpty();
    }
}
