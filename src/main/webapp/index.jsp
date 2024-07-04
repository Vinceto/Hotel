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
    <%
        HabitacionBusiness habitacionBusiness = new HabitacionBusiness();
        List<Habitacion> habitaciones = habitacionBusiness.obtenerHabitaciones();
    %>

    <h4 class="mt-5">Habitaciones Disponibles (<%= habitaciones.size() %>)</h4>

    <form method="post" action="procesa.jsp">
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
            <% for (Habitacion habitacion : habitaciones) { %>
            <div class="col mb-4">
                <div class="card h-100">
                    <img src="assets/img/<%= habitacion.getId() %>.jpg" class="card-img-top" alt="<%= habitacion.getNombre() %>">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title font-weight-bold"><%= habitacion.getNombre() %></h5>
                        <p class="card-text flex-grow-1">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis at velit maximus, molestie est a, tempor magna.</p>
                        <p class="card-text">Precio: $<%= habitacion.getPrecio() %></p>
                        <div class="mt-auto text-center">
                            <input type="radio" name="idhabitacion" value="<%= habitacion.getId() %>" class="btn-check" id="habitacion_<%= habitacion.getId() %>" autocomplete="off">
                            <label class="btn btn-outline-primary" for="habitacion_<%= habitacion.getId() %>">Seleccionar</label>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>

        <div class="form-group mt-5">
            <h4>Información de Reserva Habitación:</h4>
            <div class="row">
                <div class="col-md-6">
                    <label for="nombre">Nombre:</label>
                    <input type="text" class="form-control" id="nombre" name="nombre">
                </div>
                <div class="col-md-6">
                    <label for="apellido">Apellido:</label>
                    <input type="text" class="form-control" id="apellido" name="apellido">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-6">
                    <label for="email">Email:</label>
                    <input type="text" class="form-control" id="email" name="email">
                </div>
                <div class="col-md-6">
                    <label for="medio_pago">Medio de Pago:</label>
                    <select id="medio_pago" name="medio_pago" class="form-select">
                        <option value="Contado">Contado</option>
                        <option value="Tarjeta">Tarjeta</option>
                    </select>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-6">
                    <label for="dias">Días:</label>
                    <select id="dias" name="dias" class="form-select">
                        <option value="1">1 día</option>
                        <option value="2">2 días</option>
                        <option value="3">3 días</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label for="fecha_entrada">Fecha de Entrada:</label>
                    <input type="date" id="fecha_entrada" name="fecha_entrada" class="form-select">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <button type="submit" class="btn btn-primary">Enviar Solicitud de Compra</button>
                </div>
            </div>
        </div>
    </form>
</div>
<jsp:include page="/assets/html/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>