<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cl.desafiolatam.business.HabitacionBusiness" %>
<%@ page import="cl.desafiolatam.model.Habitacion" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <jsp:include page="/assets/html/head.jsp"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-+0vH4c/yZLIH2ZscQ6YU5yG8s1YndbJ5fTh3IWkqj5tmA21+X4RrF1euhF4AihpF" crossorigin="anonymous">
    <title>Detalle de Solicitud</title>
</head>
<body>
<jsp:include page="/assets/html/header.jsp"/>
<div class="container mt-5">
    <%
        request.setCharacterEncoding("UTF-8");
        HabitacionBusiness habitacionBusiness = new HabitacionBusiness();
        String idHabitacionParam = request.getParameter("idhabitacion");
        int idHabitacion = idHabitacionParam != null ? Integer.parseInt(idHabitacionParam) : 0;
        Habitacion habitacion = habitacionBusiness.obtenerHabitacionPorId(idHabitacion);
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String medioPago = request.getParameter("medio_pago");
        int dias = Integer.parseInt(request.getParameter("dias"));
        String fechaEntrada = request.getParameter("fecha_entrada");
        int valor = habitacion.getPrecio() * dias;
    %>
    <h2 class="mb-4">Detalle solicitud: Habitación <b><%= habitacion.getId() %></b> <b><%= habitacion.getNombre() %></b></h2>
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead class="table-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Item</th>
                <th scope="col">Valor</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row"><%= habitacion.getId() %></th>
                <td>Nombre</td>
                <td><%= nombre %></td>
            </tr>
            <tr>
                <th scope="row"><%= habitacion.getId() %></th>
                <td>Apellido</td>
                <td><%= apellido %></td>
            </tr>
            <tr>
                <th scope="row"><%= habitacion.getId() %></th>
                <td>Email</td>
                <td><%= email %></td>
            </tr>
            <tr>
                <th scope="row"><%= habitacion.getId() %></th>
                <td>Medio de Pago</td>
                <td><%= medioPago %></td>
            </tr>
            <tr>
                <th scope="row"><%= habitacion.getId() %></th>
                <td>Días</td>
                <td><%= dias %></td>
            </tr>
            <tr>
                <th scope="row"><%= habitacion.getId() %></th>
                <td>Fecha de Entrada</td>
                <td><%= fechaEntrada %></td>
            </tr>
            <tr>
                <th scope="row"><%= habitacion.getId() %></th>
                <td>Valor a Pagar</td>
                <td>CL$ <%= valor %></td>
            </tr>
            </tbody>
        </table>
    </div>
    <a href="index.jsp" class="btn btn-primary mt-3">Volver al inicio</a>
</div>
<jsp:include page="/assets/html/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>