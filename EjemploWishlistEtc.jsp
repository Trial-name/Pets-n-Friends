<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Pacientes</title>
    <link rel="stylesheet" href="Diseño.css">
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="Inicio.html">Inicio</a></li>
                <li><a href="Pacientes.jsp">Pacientes</a></li>
                <li><a href="Doctores.html">Doctores</a></li>
                <li><a href="Especialidades.html">Especialidades</a></li>
                <li><a href="Centros.html">Centros</a></li>
                <li><a href="Citas.html">Citas</a></li>
            </ul>
        </nav>
    </header>

    <section>

        <a href="AgregarPaciente.jsp">Agregar Paciente...</a> <br>
        <a href="AgregarTelPaciente.html">Agregar Teléfono a Paciente Existente...</a> <br> <br>

        <h2>Pacientes</h2>

        <%
            Connection conn = null;
            PreparedStatement ps = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "BRYAN", "Bryan0505");
            ps = conn.prepareStatement("Select * from Paciente");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
            	Date fechaNacimiento = rs.getDate("Fecha_nacimiento");
            	int idPaciente = rs.getInt("ID_paciente");
                String nombreP = rs.getString("Nombre_P");
                String nombreS = rs.getString("Nombre_S");
                String apellidoP = rs.getString("Apellido_P");
                String apellidoS = rs.getString("Apellido_S");
                String cedulaP = rs.getString("cedula_p");
                String sexo = rs.getString("Sexo");
                String correoP = rs.getString("correo_p");
                String provinciaP = rs.getString("provincia_p");
                String distritoP = rs.getString("distrito_p");
                String corregimientoP = rs.getString("corregimiento_p");
                String calleP = rs.getString("calle_p");
                int tipoSangreId = rs.getInt("ID_Sangre");
                
                LocalDate hoy = LocalDate.now();
                int edad = (int) ChronoUnit.YEARS.between(fechaNacimiento.toLocalDate(), hoy);
                out.println("<div>");
                out.println("<h6>#" + idPaciente + "</h6><br>");
                out.println("<h4>" + nombreP + " " + nombreS + " " + apellidoP + "  "+ apellidoS + "</h4><br>");
                out.println("<h5>" + cedulaP + "</h5><br>");
                out.println("<h5>" + sexo + "</h5><br>");
                out.println("<h5>Edad: " + edad + "</h5><br>");
                out.println("<h5>Correo: " + correoP + "</h5><br>");
                out.println("<h5>Provincia: " + provinciaP + "</h5><br>");
                out.println("<h5>Distrito: " + distritoP + "</h5><br>");
                out.println("<h5>Corregimiento: " + corregimientoP + "</h5><br>");
                out.println("<h5>Calle: " + calleP + "</h5><br>");
                PreparedStatement st = conn.prepareStatement("Select Tipo_Sangre from Sangre_Tipo where ID_Sangre = ?");
                st.setString(1, Integer.toString(tipoSangreId));
                ResultSet san = st.executeQuery();
                if(san.next())
                {
                    String tipoSangre = san.getString("Tipo_sangre");
                out.println("<h5>Tipo de Sangre " + tipoSangre + "</h5><br><br>");
                }

                out.println("<h5>Teléfonos</h5><br>");
                st = conn.prepareStatement("Select num_telP from Tel_Paciente where ID_Paciente=?");
                st.setString(1, Integer.toString(idPaciente));
                san = st.executeQuery();
                while(san.next())
                {
                	String tel = san.getString("num_telP");
                	out.println("<h5>" + tel + "</h5><br>");
                }
                out.println("<br><br><br>");
            }
        %>

    </section>
</body>
</html>
