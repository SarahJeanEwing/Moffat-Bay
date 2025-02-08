package com.moffatbay.servlets;

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
import java.sql.SQLException;
import java.util.List;

@WebServlet("/confirm-reservation")
public class ConfirmReservationServlet extends HttpServlet {
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Reservation reservation = (Reservation) session.getAttribute("reservation");

        String query = "INSERT INTO reservations (reservation_id, customer_id, slip_id, checkin_date, checkout_date, active, power) VALUES (?, ?, ?, ?, ?, ?, ?)";
        List<Object> parameters = List.of(
                reservation.getReservationId(),
                reservation.getCustomerId(),
                reservation.getSlipId(),
                reservation.getCheckinDate(),
                reservation.getCheckoutDate(),
                reservation.isActive(),
                reservation.isPower()
        );

        try {
            DatabaseUtils.executeUpdate(query, parameters, dbURL, dbUser, dbPassword);
            session.removeAttribute("reservation");
            session.setAttribute("reservationMessage", "Your reservation has been confirmed successfully.");
            response.sendRedirect("reservation-summary");
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Database access error", e);
        }
    }
}
