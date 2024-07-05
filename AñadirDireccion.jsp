page import="java.lang.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Añadir Dirección</title>
</head>
<body>
    <% 
        String nombre = request.getParameter("name");
        String calle = request.getParameter("street");
        String corregimiento = request.getParameter("neighborhood");
        String distrito = request.getParameter("district");
        String provincia = request.getParameter("province");


        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection dbconection = DriverManager.getConnection("jdbc:mysql://localhost:3306/petsfriends","root","");
        Statement state = dbconection.createStatement();
        String sql = "INSERT INTO direccion_cliente (nombre_direccion, calle, corregimiento, distrito, provincia) VALUES ('"+nombre+"','"+calle+"' , '"+corregimiento+"', '"+distrito+"' ,'"+provincia+"' )";
        
          state.executeUpdate(sql);
          
          if (sql != null)  {
        	  %>
        	  <h1>La dirección se añadió correctamente.</h1>
        	  <%
          }
          %>
          </body>
</html>
