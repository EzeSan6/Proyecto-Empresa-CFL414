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
                    <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = null;            
                String qProd ="INSERT INTO tb_productos (nom_producto, descr_producto, costo_producto) VALUES (?,?,?); "
                            + "SET @id_producto= LAST_INSERT_ID(); "
                            + "INSERT INTO tb_productos_sucursales (id_producto, id_sucursal) VALUES ((SELECT id_producto FROM tb_productos WHERE nom_producto=?),?,?)";
                PreparedStatement consultaCurs = null;
                String vId = request.getParameter("id");
                String vDesc = request.getParameter("desc");
                String vCosto = request.getParameter("costo");
                String vProd = request.getParameter("prod");
               
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyectoempresa", "root", "");
                    consultaProd = conexion.prepareStatement(qProd);
                    consultaProd.setString(1, request.getParameter("prod"));
                    consultaProd.setString(2, request.getParameter("desc"));
                    consultaProd.setString(3, request.getParameter("costo"));
                    consultaProd.setString(4, request.getParameter("id"));
                    consultaProd.execute();
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
