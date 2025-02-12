package com.moffatbay.servlets;

import com.moffatbay.beans.Customer;
import com.moffatbay.beans.Reservation;
import com.moffatbay.utils.DatabaseUtils;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.Serial;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
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
        ServletContext context = getServletContext();
        dbURL = context.getInitParameter("dbURL");
        dbUser = context.getInitParameter("dbUser");
        dbPassword = context.getInitParameter("dbPassword");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Redirect to login if user is not authenticated
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("user");

        if (customer == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int customerId = customer.getCustomerId();

        // Fetch the reservation(s) for the customer
        List<Reservation> reservations = getReservationsByCustomerId(customerId);

        // Set the reservations in the request
        if (reservations != null && !reservations.isEmpty()) {
            request.setAttribute("reservations", reservations);
        } else {
            request.setAttribute("reservations", null);
            request.setAttribute("message", "You currently have no reservations.");
        }

        request.getRequestDispatcher("/reservation-lookup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward POST requests to doGet
        doGet(request, response);
    }

    private List<Reservation> getReservationsByCustomerId(int customerId) {
        String query = "SELECT * FROM reservations WHERE customer_id = ?";
        List<Object> parameters = List.of(customerId);

        try {
            List<Map<String, Object>> results = DatabaseUtils.executeQueryWithParams(query, parameters, dbURL, dbUser, dbPassword);
            List<Reservation> reservations = new ArrayList<>();

            for (Map<String, Object> row : results) {
                Reservation reservation = new Reservation();
                reservation.setReservationId((String) row.get("reservation_id"));
                reservation.setSlipId((Integer) row.get("slip_id"));
                reservation.setCheckinDate((Date) row.get("checkin_date"));
                reservation.setCheckoutDate((Date) row.get("checkout_date"));
                reservation.setPower((Boolean) row.get("power"));
                // Set other reservation properties as needed

                reservations.add(reservation);
            }

            return reservations;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
}
