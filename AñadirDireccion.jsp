<%@ page import="java.lang.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<h1> Se ha añadido Correctamente la direccion</h1>
    <% 
        String nombre = request.getParameter("name");
        String telefono = request.getParameter("phone");
        String direccion = request.getParameter("address");
        String corregimiento = request.getParameter("neighborhood");
        String distrito = request.getParameter("district");
        String provincia = request.getParameter("province");


        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection dbconection = DriverManager.getConnection("jdbc:mysql://localhost:3306/petsfriends","root","");
        Statement state = dbconection.createStatement();
        String sql = "INSERT INTO direccion_cliente (nombre, telefono, direccion, corregimiento, distrito, provincia) VALUES ('"+nombre+"', '"+telefono+"','"+direccion+"' , '"+corregimiento+"', '"+distrito+"' ,'"+provincia+"' )";
        
          state.executeUpdate(sql);
          %>
          </body>
</html>
