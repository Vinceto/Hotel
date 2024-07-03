<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cl.desafiolatam.business.HabitacionBusiness" %>
<%@ page import="cl.desafiolatam.model.Habitacion" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/assets/html/head.jsp"/>
</head>
<body>
<jsp:include page="/assets/html/header.jsp"/>
<div class="container">
    <h1>Reserva de Habitaciones</h1>

    <%
        // Instanciar HabitacionBusiness y obtener la lista de habitaciones
        HabitacionBusiness habitacionBusiness = new HabitacionBusiness();
        List<Habitacion> habitaciones = habitacionBusiness.obtenerHabitaciones();
    %>

    <form method="post" action="procesa.jsp">
        <label>Selecciona una habitación:</label><br>
        <%
            for (Habitacion habitacion : habitaciones) {
                out.println("<input type='radio' name='idhabitacion' value='" + habitacion.getId() + "'> " + habitacion.getNombre() + "<br>");
            }
        %>

        <label for="nombre">Nombre:</label>
        <input type="text" class="form-control" id="nombre" name="nombre"><br>

        <label for="apellido">Apellido:</label>
        <input type="text" class="form-control" id="apellido" name="apellido"><br>

        <label for="email">Email:</label>
        <input type="text" class="form-control" id="email" name="email"><br>

        <label for="medio_pago">Medio de Pago:</label>
        <select id="medio_pago" name="medio_pago" class="form-select">
            <option value="Contado">Contado</option>
            <option value="Tarjeta">Tarjeta</option>
        </select><br>

        <label for="dias">Días:</label>
        <select id="dias" name="dias" class="form-select">
            <option value="1">1 día</option>
            <option value="2">2 días</option>
            <option value="3">3 días</option>
        </select><br>

        <label for="fecha_entrada">Fecha de Entrada:</label>
        <input type="date" id="fecha_entrada" name="fecha_entrada" class="form-select"><br>

        <button type="submit" class="btn btn-primary">Enviar Solicitud de Compra</button>
    </form>
</div>
<jsp:include page="/assets/html/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>