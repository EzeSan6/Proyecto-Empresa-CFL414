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
        <title>Muestra Stock</title>
    </head>
    <body>
        <%
        Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = null;            
            String qProd ="SELECT tb_productos.nom_producto AS producto,"
                        + "       tb_productos.costo_producto AS costo,"
                        + "       tb_sucursales.nom_sucursal AS sucursal,"
                        + "       tb_productos_sucursales.stock_producto AS stock"
                        + " FROM tb_productos_sucursales"
                        + "    JOIN tb_productos ON tb_productos_sucursales.id_producto = tb_productos.id_producto"
                        + "    JOIN tb_sucursales ON tb_productos_sucursales.id_sucursal = tb_sucursales.id_sucursal"
                        + "        AND tb_sucursales.id_sucursal = ?";
            PreparedStatement consultaProd = null;
       
            try {
                
                conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyectoempresa", "root", "");                
                consultaProd = conexion.prepareStatement(qProd);
                consultaProd.setString(1, request.getParameter("id"));
                ResultSet listaProd = consultaProd.executeQuery();
                while (listaProd.next()){
                    %>
                    <ul>
                        <li><%out.print(listaProd.getString("producto"));%></li>
                        <li><%out.print(listaProd.getString("costo"));%></li>
                        <li><%out.print(listaProd.getString("stock"));%></li>

                    </ul>
                    <%
                }                                       
                out.print("Cargado");
            } catch (Exception e) {
                e.printStackTrace();
                out.println(consultaProd + "</br>");                  
            } finally {
                try {
                    consultaProd.close();
                    conexion.close();
                } catch (Exception e) {
                }
            }
        %>
    </body>
</html>
