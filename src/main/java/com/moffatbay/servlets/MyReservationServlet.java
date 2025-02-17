package com.moffatbay.servlets;

import com.moffatbay.beans.Customer;
import com.moffatbay.beans.Reservation;
import com.moffatbay.utils.DatabaseUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.Serial;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@WebServlet("/my_reservation")
public class MyReservationServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
    private static String email;
    private static String reservationId;
    private static String customerId;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Customer customer = (Customer) request.getSession().getAttribute("user");

        email = customer.getEmail();
        customerId = String.valueOf(Objects.requireNonNull(DatabaseUtils.getCustomerByEmail(email)).getCustomerId());
        // Get reservations by customer ID
        List<Reservation> reservations = getReservationsByCustomerId(customerId);
        request.setAttribute("reservations", reservations);

        request.setAttribute("email", email);
        request.setAttribute("reservationId", reservationId);
        request.setAttribute("customerId", customerId);
        request.getRequestDispatcher("/my-reservation.jsp").forward(request, response);
    }


    private List<Reservation> getReservationsByCustomerId(String customerId) {
        String query = "SELECT * FROM reservations WHERE customer_id = ?";
        List<Object> parameters = List.of(customerId);

        try {
            List<Map<String, Object>> results = DatabaseUtils.executeQueryWithParams(query, parameters);
            return results.stream().map(this::mapToReservation).toList();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return List.of();
    }

    private Reservation mapToReservation(Map<String, Object> row) {
        Reservation reservation = new Reservation();
        reservation.setReservationId((String) row.get("reservation_id"));
        reservation.setCustomerId((Integer) row.get("customer_id"));
        reservation.setSlipId((Integer) row.get("slip_id"));
        reservation.setCheckinDate((Date) row.get("checkin_date"));
        reservation.setCheckoutDate((Date) row.get("checkout_date"));
        reservation.setActive((Boolean) row.get("active"));
        reservation.setPower((Boolean) row.get("power"));
        return reservation;
    }
}
