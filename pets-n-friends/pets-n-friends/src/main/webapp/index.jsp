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
    List<producto> products = pd.getRecProducts();
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
            <div id="news">
                <h1>NOTICIAS</h1>
                <a href="https://elpais.com/escaparate/estilo-de-vida/2024-07-05/zooplus-hidratar-gato.html">
                    <div class="news-item">
                        <img src="https://imagenes.elpais.com/resizer/v2/WMDX4RFKNBHSNNFAJSHYA3JUZU.png?auth=bb0ae89248d71fc39b9bbade3230def212cab185cc2696792ef964898acd4f7e&width=1200" width="40%" height="auto">
                        <div class="info">
                            <h2>¿Cómo hidratar a mi gato en verano?</h2>
                            <p>Sopas y bebidas, ‘snacks’ líquidos, fuentes o alimentación húmeda: encuentra la comida más refrescante y al mejor precio aplicando el cupón PAIS-VERANO</p>
                        </div>
                    </div>
                </a>
                <a href="https://elpais.com/estilo-de-vida/2024-07-02/son-las-dietas-naturales-como-la-barf-un-peligro-para-las-mascotas.html">
                    <div class="news-item">
                        <img src="https://imagenes.elpais.com/resizer/v2/CX7YUWZ7F5CTZA22S7QG6ODG3E.jpg?auth=5de85ca7e704fd88182749b8c797e82be8981437f1f6a72ed32cd858d3cb4b74&width=1200" width="40%" height="auto">
                        <div class="info">
                            <h2>¿Son las dietas naturales como la BARF un peligro para las mascotas?</h2>
                            <p>La dieta conocida como “alimentación cruda”, y la dieta cocinada para perros y gatos son cada vez más frecuentes entre las familias multiespecie. Con estudios a favor y en contra de una nutrición natural alejada de productos procesados, el debate salta de las redes sociales a los menús para animales</p>
                        </div>
                    </div>
                </a>
                <a href="https://youtu.be/Ocxm0j_aT-w?si=q8D2qAOaFdEHtA_0">
                    <div class="news-item">
                        <img src="https://escuelaversailles.com/wp-content/uploads/shutterstock_1569883195.jpg" width="40%" height="auto">
                        <div class="info">
                            <h2>¿Cómo BAÑAR a un PERRO en CASA?(video)</h2>
                            <p>¿Quieres saber cómo BAÑAR a tu PERRO en casa? En este vídeo de ExpertoAnimal, en colaboración con VETFORMACIÓN y la Peluquería canina Enea, te enseñamos el PASO A PASO para saber cómo bañar a un perro correctamente. El baño es un momento complicado para algunos perros, debemos hacerlo adecuadamente para que no pase miedo ni estrés.</p>
                        </div>
                    </div>
                </a>
            </div>
            <div>
            <h1>PRODUCTOS RECOMENDADOS</h1>
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
