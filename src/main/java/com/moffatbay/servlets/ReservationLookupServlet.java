package com.moffatbay.servlets;

import com.moffatbay.beans.Customer;
import com.moffatbay.beans.Reservation;
import com.moffatbay.utils.DatabaseUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.Serial;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet("/reservation_lookup")
public class ReservationLookupServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    private String dbURL;
    private String dbUser;
    private String dbPassword;

    @Override
    public void init() {
        dbURL = getServletContext().getInitParameter("dbName");
        dbUser = getServletContext().getInitParameter("dbUser");
        dbPassword = getServletContext().getInitParameter("dbPass");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Check if user is logged in
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("user");

        if (customer == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            int customerId = customer.getCustomerId();

            // Fetch the reservation for the customer
            Reservation reservation = getReservationByCustomerId(customerId);

            if (reservation != null) {
                // Set reservation in request scope
                request.setAttribute("reservation", reservation);
            } else {
                // No reservation found
                request.setAttribute("reservation", null);
                request.setAttribute("message", "You currently have no reservations.");
            }

            // Forward to JSP
            request.getRequestDispatcher("/reservation-lookup.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("error", "There was an error retrieving your reservation. Please try again.");
            request.getRequestDispatcher("/reservation-lookup.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward POST requests to doGet
        doGet(request, response);
    }

    private Reservation getReservationByCustomerId(int customerId) throws SQLException, ClassNotFoundException {
        String query = "SELECT * FROM reservations WHERE customer_id = ?";
        List<Object> parameters = List.of(customerId);

        // Call the method with the correct parameters
        List<Map<String, Object>> results = DatabaseUtils.executeQueryWithParams(query, parameters);

        if (!results.isEmpty()) {
            Map<String, Object> row = results.get(0);
            Reservation reservation = new Reservation();
            reservation.setReservationId((String) row.get("reservation_id"));
            reservation.setCustomerId((Integer) row.get("customer_id"));
            reservation.setSlipId((Integer) row.get("slip_id"));
            reservation.setCheckinDate((Date) row.get("checkin_date"));
            reservation.setCheckoutDate((Date) row.get("checkout_date"));
            reservation.setActive((Boolean) row.get("active"));
            reservation.setPower((Boolean) row.get("power"));
            // Set other properties as needed
            return reservation;
        }
        return null;
    }
}
