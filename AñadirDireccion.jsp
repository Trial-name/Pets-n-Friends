<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!doctype html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Añadir dirección</title>
</head>
<body>
    <% 
        String nombre = request.getParameter("name");
        String telefono = request.getParameter("phone");
        String direccion = request.getParameter("address");
        String corregimiento = request.getParameter("neighborhood");
        String distrito = request.getParameter("district");
        String provincia = request.getParameter("province");
     // Validación básica para asegurar que los campos requeridos no estén vacíos
        if (nombre == null || telefono == null || direccion == null || corregimiento == null || distrito == null || provincia == null ||
            nombre.isEmpty() || telefono.isEmpty() || direccion.isEmpty() || corregimiento.isEmpty() || distrito.isEmpty() || provincia.isEmpty()) {
%>
            <p>Error: Todos los campos son obligatorios.</p>
<%
            return; // Terminar la ejecución si algún campo está vacío
        }

        try {
            // Configuración de la conexión a la base de datos
            String url = "jdbc:mysql://localhost:3306/petstoredb";
            String username = "root";
            String password = "";
            
            // Establecer conexión
            Class.forName("com.mysql.jdbc.Driver");
            Connection dbconnection = DriverManager.getConnection(url, username, password);
            
            // Crear una declaración SQL para insertar datos
            String sql = "INSERT INTO direccion_cliente (nombre, telefono, direccion, corregimiento, distrito, provincia) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = dbconnection.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setString(2, telefono);
            statement.setString(3, direccion);
            statement.setString(4, corregimiento);
            statement.setString(5, distrito);
            statement.setString(6, provincia);
            
            // Ejecutar la inserción de datos
            int rows = statement.executeUpdate();

            // Cerrar recursos
            statement.close();
            dbconnection.close();

            // Mostrar mensaje de éxito o error
            if (rows > 0) {
    %>
                <h1>La dirección se añadió correctamente.</h1>
    <%
            } else {
    %>
                <h1>Error al añadir la dirección.</h1>
    <%
            }

        } catch (Exception e) {
            e.printStackTrace();
    %>
            <h1>Error en la base de datos: <%= e.getMessage() %></h1>
    <%
        }
    %>
</body>
</html>
