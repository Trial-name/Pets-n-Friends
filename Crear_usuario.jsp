<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.lang.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PET SHOP</title>
</head>
<body>
<h1> Se ha creado su cuenta</h1>
	<%
	String nombre_usuario = request.getParameter("Nombre");
	String apellido = request.getParameter("Apellido");
	String email = request.getParameter("email");
	String telefono_usuario = request.getParameter("Telefono");
	String contrasena = request.getParameter("Contrasena");
	
	

Class.forName("com.mysql.jdbc.Driver");
Connection dbconection = DriverManager.getConnection("jdbc:mysql://localhost:3306/petshop","root","");
Statement state = dbconection.createStatement();
String a = "INSERT INTO usuario (nombre_usuario, apellido, email, telefono_usuario, contrasena)VALUE('"+nombre_usuario+"','"+apellido+"','"+email+"', "+telefono_usuario+",'"+contrasena+"')";
state.executeUpdate(a);

%>
<%  response.sendRedirect("iniciar cuenta.html"); %>
</body>
</html>
