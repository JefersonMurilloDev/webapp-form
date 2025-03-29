package org.jmurillo.apiservlet.webapp.form;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;


@WebServlet("/registro")
public class FormServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        String username = req.getParameter("name");
        String pass = req.getParameter("password");
        String email = req.getParameter("email");
        String saludo = "Este es mi password";
        String pais = req.getParameter("pais");
        String[] lenguajes = req.getParameterValues("lenguajes");
        String[] roles = req.getParameterValues("roles");

        String idiomas = req.getParameter("idiomas");
        boolean habilitar = req.getParameter("habilitar") != null
                && req.getParameter("habilitar").equals("on");
        String secreto = req.getParameter("secret");

        // Validacion
        FormValidator validator = new FormValidator();
        validator.validarUsername(username);
        validator.validarPassword(pass);
        validator.validarEmail(email);
        validator.validarPais(pais);
        validator.validarLenguajes(lenguajes);
        validator.validarRoles(roles);
        validator.validarIdioma(idiomas);


        if (validator.hayErrores()) {
            try (PrintWriter uot = resp.getWriter()) {

                uot.println("<!DOCTYPE html");
                uot.println("<html>");
                uot.println("<head>");
                uot.println("        <meta charset=\"UTF-8\">");
                uot.println("        <title>Resultado form</title>");
                uot.println("</head>");
                uot.println("   <body>");
                uot.println("       <h1>Resultado form!</h1>");

                uot.println("         <ul>");
                uot.println("            <li>Username: " + username + "</li>");
                uot.println("            <li>Password: " + saludo + "</li>");
                uot.println("            <li>Email: " + email + "</li>");
                uot.println("            <li>Pais: " + pais + "</li>");
                uot.println("            <li>Lenguajes: <ul>");
                Arrays.asList(lenguajes).forEach(lenguaje -> {
                    uot.println("                      <li>" + lenguaje + "</li>");
                });
                uot.println("            </ul></li>");
                uot.println("            <li>Roles: <ul>");
                Arrays.asList(roles).forEach(role -> {
                    uot.println("                      <li>" + role + "</li>");
                });
                uot.println("            </ul></li>");
                uot.println("             <li>Idioma: " + idiomas + "</li>");
                uot.println("             <li>Habilitar: " + habilitar + "</li>");
                uot.println("             <li>Secreto: " + secreto + "</li>");
                uot.println("         </ul>");
                uot.println("   </body>");
                uot.println("</html>");
            }
        } else {
            /**validator.getErrores().forEach(error -> {
             uot.println("<li>" + error + "</li>");
             });
             uot.println("<p><a href=\"/webapp-form/index.jsp\">volver</a></p>");**/
            req.setAttribute("errores", validator.getErrores());
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}
