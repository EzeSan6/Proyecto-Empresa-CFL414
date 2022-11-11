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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            String consulta1 = "SELECT nom_producto, descr_producto, costo_producto FROM tb_productos";
            String consulta2 = "SELECT stock_producto FROM tb_productos_sucursales;";
            Connection conexion = null;
            PreparedStatement consultaContar = null;
            try{
                conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyectoempresa", "root", "");
                consultaContar = conexion.prepareStatement(consulta1);
            }catch{
            
            }
            %>
    </body>
</html>
