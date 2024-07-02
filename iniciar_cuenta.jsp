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
	<%
	String email = request.getParameter("email-telefono");
	String contrasena = request.getParameter("contrasena");
	
	

Class.forName("com.mysql.jdbc.Driver");
Connection dbconection = DriverManager.getConnection("jdbc:mysql://localhost:3306/petsfriends","root","");
Statement state = dbconection.createStatement();

PreparedStatement verificar = dbconection.prepareStatement("SELECT * FROM cuenta_usuario WHERE email = ? AND contrasena = ?");
verificar.setString(1, email);
verificar.setString(2, contrasena);

ResultSet resultado = verificar.executeQuery();
String msg;
if (resultado.next()) {
    response.sendRedirect("Inicio.html");  // Redirigir a la página principal
}
 else{
    response.sendRedirect("iniciar cuenta.html?error=invalid");  // Redirigir a la página de login con un mensaje de error
    msg = "<h1 style='color: red;'>****ERROR*** <br> USUARIO INCORRECTO</h1>";
 }

%>
</body>
</html>
