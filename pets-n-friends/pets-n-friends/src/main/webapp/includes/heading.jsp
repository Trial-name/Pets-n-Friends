 <header>
<!-- nav bar -->
	<div id="nav-div">
	
	<% 
		if(auth == null){	%>
		<div id="login-options">
			<div><a href="login.jsp" class="nav-button">iniciar sesion / </a></div> 
			<div><a href="registro.jsp" class="nav-button">/ registrar</a></div> 
		</div>
		<div>
			<ul id="navbar">
				<li><a href="productos.jsp" class="nav-button">productos</a></li>
			</ul>	
		</div>	
	
		<% }else{%>
		<div id="login-options">
			<div><a href="user-logout" class="nav-button">cerrar sesion</a></div> 
		</div>
			<div>
			<ul id="navbar">
				<li><a href="productos.jsp" class="nav-button">productos</a></li>
				<!-- /*<li><a href="direcciones.jsp" class="nav-button">direcciones</a></li>*/
				 --><li><a href="wishlist.jsp" class="nav-button">wishlist</a></li>
				<!--  <li><a href="orders.jsp" class="nav-button">ordenes</a></li>*/
				--><li><a href="cart.jsp" class="nav-button"><img src="imgs/shopping-cart.png" height="16 px"></a></li>
			</ul>	
		</div>	
		<%} %>

			
	</div>
	
<!-- search bar -->
	<div id="search-div">
		<a href="index.jsp"><img src="imgs/logo.png" width="75 px"></a>
		<div id="search-bar">
			<input type="text" placeholder="Buscar">
			<button>Buscar</button>
		</div>
	</div>
	
<!-- categorias -->
	<!-- /*<div id="catg-div">
		<ul id="categorias">
			<li><a href="alimentos.jsp" class="nav-button">Alimentos</a></li>
			<li><a href="juguetes.jsp" class="nav-button">Juguetes</a></li>
			<li><a href="accesorios.jsp" class="nav-button">Accesorios</a></li>
		</ul>
	</div>*/ -->
</header>