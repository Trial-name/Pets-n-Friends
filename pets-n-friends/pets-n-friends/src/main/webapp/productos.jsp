<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="cn.utp.connection.*" %>
<%@page import="cn.utp.model.*" %>
<%@page import="cn.utp.dao.*" %>
<%@page import="java.util.*" %>

<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }

    productDao pd = new productDao(DBcon.getConneciton());
    List<producto> products = pd.getAllProducts();
    request.setAttribute("products", products);
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/head.jsp" %>
        <title>home</title>
    </head>
    <body>
        <%@include file="includes/heading.jsp" %>
        <div id="content">
            <div>
            <h1>PRODUCTOS</h1>
            </div>
            <div id="products">
                <%
                    if (!products.isEmpty()) {
                        for (producto p : products) {
                %>
                <div class="product-container">
                    <div class="product-image">
                        <img src="<%= p.getImageUrl() %>">
                    </div>
                    <div class="product-name">
                        <h3><%= p.getNombre() %></h3>
                    </div>
                    <div class="product-price">
                        Precio: <%= p.getPrecio() %>
                    </div>
                    <div class="product-desc">
                        <%= p.getDescripcion() %>
                    </div>
                    <div class="product-buttons">
                        <a href="#" class="button">Añadir al carrito</a>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
        <%@include file="includes/footing.jsp" %>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>