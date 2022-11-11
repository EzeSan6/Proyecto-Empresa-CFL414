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
        <div id="main">
                <form id="carga" method="post">
                    Nombre <input type="text" name="nombre" /></br>
                    Descripcion <input type="text" name="descrip" /></br> 
                    Costo <input type="text" name="costo" /></br> 
                    <input type="submit" value="Aceptar" />
                </form>                        
                <%
                Class.forName("com.mysql.jdbc.Driver");
                String selectProdu = "SELECT * FROM tb_productos";               
                Connection conexion = null;
                PreparedStatement consultaProdu = null;
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyectoempresa", "root", "");
                    consultaProdu = conexion.prepareStatement(selectProdu);
                    ResultSet listaProdu = consultaProdu.executeQuery();
                    while (listaProdu.next()) {
                       out.print("<option value='"+listaProdu.getString("nom_producto", "descr_producto", "costo_producto")+"'>"+listaProdu.getString("nom_productos", "descr_producto", "costo_producto")+"</option>");
                    }
                    
                    listaProdu.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("exepcion </br>");
                    out.println("detalle de la consulta: </br>");
                    out.println(consultaProdu + "</br>");
                } finally {
                        try {        
                            consultaProdu.close();
                            conexion.close();
                        } catch (Exception e) {
                    }
                }
            %>
                </select>

        </div>
    </body>
</html>
