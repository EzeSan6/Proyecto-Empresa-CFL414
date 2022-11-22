<%-- 
    Document   : empresa
    Created on : 9 nov. 2022, 19:07:49
    Author     : Eze
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Elimina Stock</title>
    </head>
    <body>
        <p>Ingrese ID del producto a eliminar</p>
        <form method="post" action="eliminastock-op.jsp">
            <input type="text" name="idprod">
            <input type="hidden" name="sucursal" value="<%out.print(request.getParameter("id"));%>">
        </form>
    </body>
</html>
