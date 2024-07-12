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
		<title>login</title>
	</head>
	<body style="display: flex;
	flex-direction:column;
    align-items: center;
    justify-content: space-between;
	margin:0;
	font-family: Arial, Helvetica, sans-serif;">
		<div class="container">
		<form action="user-login" method="post">
			<div class="form-header">
				<h1>INICIAR SESION</h1>
			</div>
			<!-- email -->
			<div>
				<label for="email">E-mail</label>
				<input type="email" name="email" required>
			</div>
			
			<!-- contraseña -->
			<div>
				<label for="contrasena">Contraseña</label>
				<input type="password" name="contrasena" required>
			</div>
			<div>
				<input type=submit value="iniciar session" class="button" id="login-button">
			</div>
		</form>
			<div>
				¿no tienes cuenta? <span><a href="registro.jsp">registrate</a></span>
			</div>
		</div>
		<%@include file="includes/footing.jsp"%>
		<%@include file="includes/footer.jsp" %>
	</body>
</html>