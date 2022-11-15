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
                String cargaProdu = "INSERT INTO tb_productos(nom_producto, descr_producto, costo_producto) VALUES (?,?,?)";
                String cargaProdu2 = "SELECT * FROM tb_productos"
                PreparedStatement insertProdu = null;
                PreparedStatement selectProdu = null;
                ResultSet listaProdus = null;
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyectoempresa", "root", "");
                    insertProdu = conexion.prepareStatement(cargaProdu);
                    insertProdu.setString(1, request.getParameter("nom"));
                    insertProdu.setString(2, request.getParameter("desc"));
                    insertProdu.setString(3, request.getParameter("costo"));
                    insertProdu.execute();
                    
                    selectProdu = conexion.prepareStatement(cargaProdu2);
                    listaProdus = selectProdu.executeQuery();
                    while (listaProdus.next()) {
                        out.print("Nombre: " + listaProdus.getString("nom_producto") + "</br>");
                        out.print("Descripcion: " + listaProdus.getString("descr_producto") + "</br>");
                        out.print("Costo: " + listaProdus.getString("costo_producto") + "</br>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("excepcion </br>");
                    out.println("detalle de la consulta: </br>");
                } finally {
                        try {        
                            listaProdus.close();
                            insertProdu.close();
                            selectProdu.close();
                            conexion.close();
                        } catch (Exception e) {
                    }
                }
            %>
    </body>
</html>
