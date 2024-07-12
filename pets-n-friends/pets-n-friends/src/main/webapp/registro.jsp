<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
    <%@page import="cn.utp.model.*" %>  
    <%User auth = (User) request.getSession().getAttribute("auth");
    	if(auth!=null){
    		request.setAttribute("auth",auth);
    		response.sendRedirect("index.jsp");
    	}

    %>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="includes/head.jsp" %>
		<title>home</title>
	</head>
	<body style="display: flex;
	flex-direction:column;
    align-items: center;
    justify-content: space-between;
	margin:0;
	font-family: Arial, Helvetica, sans-serif;">
		<div class="container">
			<div class="form-header">
				<h1>Registro</h1>
			</div>
			<!-- nombre -->
			<div id="full-name">
				<div>
				<label for="nombre">Nombre</label>
				<input type="text" name="nombre" required>
				</div>
				
				<div>
				<label for="apellido">apellido </label>
				<input type="text" name="apellido" required>
				</div>
			</div>
			<div>
				<label for="email">E-mail</label>
				<input type="email" name="email" required>
			</div>
			<div>
				<label for="numero">telefono</label>
				<input type="text" name="numero" required>
				</div>
			
			<!-- contraseña -->
			<div>
				<label for="contrasena">Contraseña</label>
				<input type="password" name="contrasena" required>
			</div>
			<div>
				<label for="repetir-contrasena">Confirmar Contraseña</label>
				<input type="password" name="repetir-contrasena" required>
			</div>
			<div>
				<input type=submit value="crear cuenta" class="button" id="login-button">
			</div>
			<div>
				¿ya tienes cuenta? <span><a href="login.jsp">inicia sesion</a></span>
			</div>
		</div>		
		<%@include file="includes/footing.jsp" %>
		<%@include file="includes/footer.jsp" %>
	</body>
</html>