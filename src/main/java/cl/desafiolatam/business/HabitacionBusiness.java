package cl.desafiolatam.business;

import cl.desafiolatam.model.Habitacion;

import java.util.ArrayList;
import java.util.List;

public class HabitacionBusiness {
    private List<Habitacion> habitaciones;

    public HabitacionBusiness() {
        this.habitaciones = new ArrayList<>();
        inicializarHabitaciones();
    }

    public List<Habitacion> obtenerHabitaciones() {
        return this.habitaciones;
    }

    public void setHabitaciones(List<Habitacion> habitaciones) {
        this.habitaciones = habitaciones;
    }

    public int calcularValor(int idHabitacion, int dias) {
        Habitacion habitacion = obtenerHabitacionPorId(idHabitacion);
        if (habitacion != null) {
            return habitacion.getPrecio() * dias;
        }
        return 0;
    }

    public Habitacion obtenerHabitacionPorId(int idHabitacion) {
        return obtenerHabitaciones().stream()
                .filter(h -> h.getId() == idHabitacion)
                .findFirst()
                .orElse(null);
    }

    private void inicializarHabitaciones() {
        List<Habitacion> habitacionesIniciales = new ArrayList<>();

        habitacionesIniciales.add(new Habitacion(1, "Suite", "Suite con vista al mar", "suite.jpg", 80000, 1, 50));
        habitacionesIniciales.add(new Habitacion(2, "Doble", "Habitación doble", "doble.jpg", 60000, 2, 30));
        habitacionesIniciales.add(new Habitacion(3, "Individual", "Habitación individual", "individual.jpg", 40000, 1, 20));
        habitacionesIniciales.add(new Habitacion(4, "Familiar", "Habitación familiar", "familiar.jpg", 100000, 4, 70));
        habitacionesIniciales.add(new Habitacion(5, "Lujo", "Habitación de lujo", "lujo.jpg", 120000, 1, 60));
        habitacionesIniciales.add(new Habitacion(6, "Economica", "Habitación económica", "economica.jpg", 30000, 2, 25));
        habitacionesIniciales.add(new Habitacion(7, "Penthouse", "Penthouse con vista panorámica", "penthouse.jpg", 200000, 3, 90));
        habitacionesIniciales.add(new Habitacion(8, "Estándar", "Habitación estándar", "estandar.jpg", 50000, 1, 35));

        setHabitaciones(habitacionesIniciales);
    }
}