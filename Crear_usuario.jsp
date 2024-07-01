<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PET SHOP</title>
</head>
<body>
<h1> Se ha creado su cuenta</h1>
	<%
	String nombre = request.getParameter("Nombre");
	String apellido = request.getParameter("Apellido");
	String email = request.getParameter("email");
	String telefono = request.getParameter("Telefono");
	String contrasena = request.getParameter("Contrasena");
	
	

Class.forName("com.mysql.jdbc.Driver");
Connection dbconection = DriverManager.getConnection("jdbc:mysql://localhost:3306/petsfriends","root","");
Statement state = dbconection.createStatement();
String a = "INSERT INTO cuenta_usuario (nombre, apellido, email, telefono, contrasena)VALUE('"+nombre+"','"+apellido+"','"+email+"', "+telefono+",'"+contrasena+"')";
state.executeUpdate(a);
%>
</body>
</html>
