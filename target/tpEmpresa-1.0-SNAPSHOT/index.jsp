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
        <title>Sucursales</title>
    </head>
    <body>
        <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = null;
                String qSucus = "SELECT * FROM tb_sucursales";
                PreparedStatement consultaSucus = null;
                ResultSet listaSucus = null;
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyectoempresa", "root", "");
                    consultaSucus = conexion.prepareStatement(qSucus);
                    listaSucus = consultaSucus.executeQuery();
                    while(listaSucus.next()){
                    %>
                    <p>Sucursal: <%out.print(listaSucus.getString("nom_sucursal"));%></p>
                        <ul>
                            <li><a href="cargastock.jsp?id=<%out.print(listaSucus.getString("id_sucursal"));%>">Carga</a><li>
                            <li><a href="muestrastock.jsp?id=<%out.print(listaSucus.getString("id_sucursal"));%>">Muestra</a><li>
                            <li><a href="eliminastock.jsp?id=<%out.print(listaSucus.getString("id_sucursal"));%>">Elimina</a><li>
                        </ul>
                    <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("excepcion </br>");
                    out.println("detalle de la consulta: </br>");
                } finally {
                    try {
                        listaSucus.close();
                        consultaSucus.close();
                        conexion.close();
                    } catch (Exception e){
                }
            }
        %>
    </body>
</html>
