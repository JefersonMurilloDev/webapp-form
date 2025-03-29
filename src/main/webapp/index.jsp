<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%
Map<String, String> errores = (Map<String, String>)request.getAttribute("errores");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formulario de usuarios</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<h3>Formulario de usuarios</h3>

<%
if(errores != null && errores.size()>0){
%>
<ul class="alert alert-danger mx-5 px-5">
<% for(String error: errores.values()){%>
<li><%=error%></li>
<%}%>
</ul>
<%}%>
<div class="px-5">
<form action="/webapp-form/registro" method="post">
    <div class="row mb-3">
        <label for="name" class="col-form-label col-sm-2">Nombre:</label>
        <div class="col-sm-4"><input type="text" id="name" name="name" id="name" class="form-contral" value="${param.name}"></div>
        <%
        if(errores != null && errores.containsKey("username")){
            out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("username") + "</small>");
        }
        %>
    </div>

    <div class="row mb-3">
        <label for="password" class="col-form-label col-sm-2">Contraseña:</label>
        <div class="col-sm-4"><input type="password" id="password" name="password" id="password" class="form.control"></div>
        <%
           if(errores != null && errores.containsKey("password")){
                out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("password") + "</small>");
           }
        %>
    </div>

    <div class="row mb-3">
        <label for="email" class="col-form-label col-sm-2">Email:</label>
        <div class="col-sm-4"><input type="email" id="email" name="email" id="email" class="form.control" value="${param.email}"></div>
        <%
           if(errores != null && errores.containsKey("email")){
            out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("email") + "</small>");
           }
        %>
    </div>

    <div class="row mb-3">
        <label for="pais" class="col-form-label col-sm-2">País</label>
        <div class="col-sm-4">
            <select name="pais" id="pais" class="form-select">
                <option value="">-- seleccionar --</option>
                <option value="ES" ${param.pais.equals("ES")? "select":""}>España</option>
                <option value="MX" ${param.pais.equals("MX")? "select":""}>México</option>
                <option value="CL" ${param.pais.equals("CL")? "select":""}>Chile</option>
                <option value="AR" ${param.pais.equals("AR")? "select":""}>Argentina</option>
                <option value="PE" ${param.pais.equals("PE")? "select":""}>Perú</option>
                <option value="CO" ${param.pais.equals("CO")? "select":""}>Colombia</option>
                <option value="VE" ${param.pais.equals("VE")? "select":""}>Venezuela</option>
            </select>
        </div>
        <%
                   if(errores != null && errores.containsKey("pais")){
                        out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("pais") + "</small>");
                   }
                %>
    </div>

    <div class="row mb-3">
        <label for="lenguajes" class="col-form-label col-sm-2">Lenguajes de progración</label>
        <div class="col-sm-4">
            <select name="lenguajes" id="lenguajes" multiple class="form-select">
                <option value="java" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("java")).get()?"select":""}>Java SE</option>
                <option value="jakartaee" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("jakartaee")).get()?"select":""}>Jakarta EE9</option>
                <option value="spring" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("spring")).get()?"select":""}>Spring Boot</option>
                <option value="js" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("js")).get()?"select":""}>JavaScript</option>
                <option value="Vue JS" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("Vue JS")).get()?"select":""}> Vue JS</option>
                <option value="react" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("react")).get()?"select":""}>React</option>
            </select>
        </div>
        <%
                   if(errores != null && errores.containsKey("lenguajes")){
                        out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("lenguajes") + "</small>");
                   }
                %>
    </div>

    <div>
        <div class="row mb-3">
            <label class="col-form-label col-sm-2">Roles</label>
            <div class="form-check col-sm-2">
                <input type="checkbox" name="roles" value="ROLE_ADMIN"
                ${paramValues.roles.stream().anyMatch(v->v.equals("ROLE_ADMIN")).get()?"checked":""}
                clas="form-check-input">
                <label class="form-check-label">Administrador</label>
            </div>
            <div class="form-check col-sm-2">
                <input type="checkbox" name="roles" value="ROLE_USER"
                ${paramValues.roles.stream().anyMatch(v->v.equals("ROLE_USER")).get()?"checked":""}
                 clas="form-check-input"
                <label class="form-check-label">Usiario</label>
            </div>
            <div class="form-check col-sm-2">
                <input type="checkbox" name="roles" value="ROLE_MODERATOR"
                ${paramValues.roles.stream().anyMatch(v->v.equals("ROLE_MODERATOR")).get()?"checked":""}
                clas="form-check-input">
                <label class="form-check-label">Moderador</label>
            </div>
            <%
                       if(errores != null && errores.containsKey("roles")){
                            out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("roles") + "</small>");
                       }
                    %>
        </div>
        <div class="row mb-3">
            <label class="col-form-label col-sm-2">Idiomas</label>
            <div class="form-check col-sm-2">
                <input type="radio" name="idiomas" value="es" clas="form-check-input" ${param.idiomas.equals("es")?"checked":""}>
                <label class="form-check-label">Español</label>
            </div>
            <div class="form-check col-sm-2">
                <input type="radio" name="idiomas" value="en" clas="form-check-input" ${param.idiomas.equals("en")?"checked":""}>
                <label class="form-check-label">Inglés</label>
            </div>
            <div class="form-check col-sm-2">
                <input type="radio" name="idiomas" value="fr" clas="form-check-input" ${param.idiomas.equals("fr")?"checked":""}>
                <label class="form-check-label">Frances</label>
            </div>
            <%
                       if(errores != null && errores.containsKey("idioma")){
                            out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("idioma") + "</small>");
                       }
                    %>
        </div>
        <div class="row mb-3">
            <label for="habilitar" class="col-form-label col-sm-2">Habilitar</label>
            <div class="form-check col-sm-2">
                <input type="checkbox" name="habilitar" id="habilitar" checked clas="form-check-input">
            </div>
        </div>
    </div>

    <div class="row mb-3">
        <div>
            <input type="submit" value="Enviar" class="btn btn-primary">
        </div>
    </div>
    <input type="hidden" name="secret" value="12345">
</form>
</div>

</body>
</html>