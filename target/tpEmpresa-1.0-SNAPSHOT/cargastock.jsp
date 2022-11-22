<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carga Stock</title>
    </head>
    <body>
        <form method="post" action="cargastock.jsp">
            Nombre del producto: <input type="text" name="nom"></br>
            Descripcion del producto: <input type="text" name="desc"></br> 
            Costo del producto: <input type="text" name="costo"></br> 
            <input type="hidden" name="id" value="<%out.print(request.getParameter("id"));%>">
            <input type="submit" value="CARGAR">
        </form>           
    </body>
</html>
