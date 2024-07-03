<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cl.desafiolatam.business.HabitacionBusiness" %>
<%@ page import="cl.desafiolatam.model.Habitacion" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/assets/html/head.jsp"/>
</head>
<body>
<div class="container mt-5">
    <%
        HabitacionBusiness habitacionBusiness = new HabitacionBusiness();
        int idHabitacion = Integer.parseInt(request.getParameter("idhabitacion"));
        Habitacion habitacion = habitacionBusiness.obtenerHabitacionPorId(idHabitacion);
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String medioPago = request.getParameter("medio_pago");
        int dias = Integer.parseInt(request.getParameter("dias"));
        String fechaEntrada = request.getParameter("fecha_entrada");
        int valor = habitacion.getPrecio() * dias;
    %>
    <h2>Detalle solicitud habitación: Habitación <b><%= habitacion.getId() %></b> <b><%= habitacion.getNombre() %></b></h2>
    <table class="table">
        <thead>
        <tr>
            <th>#</th>
            <th>Nombre</th>
            <th>Apellido</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td><%= nombre %></td>
            <td><%= apellido %></td>
        </tr>
        <tr>
            <td>2</td>
            <td><%= habitacion.getId() %></td>
            <td><%= habitacion.getNombre() %></td>
        </tr>
        </tbody>
    </table>
    <p><strong>Email:</strong> <%= email %></p>
    <p><strong>Medio de Pago:</strong> <%= medioPago %></p>
    <p><strong>Días:</strong> <%= dias %></p>
    <p><strong>Fecha de Entrada:</strong> <%= fechaEntrada %></p>
    <p><strong>Valor a Pagar:</strong> CL$ <%= valor %></p>
    <a href="index.jsp" class="btn btn-primary">Volver al inicio</a>
</div>
<jsp:include page="/assets/html/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>