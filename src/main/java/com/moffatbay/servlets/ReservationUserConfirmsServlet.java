package com.moffatbay.servlets;

import com.moffatbay.beans.Reservation;
import com.moffatbay.beans.Customer;
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

@WebServlet("/reservation-confirmation")
public class ReservationUserConfirmsServlet extends HttpServlet {
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
        HttpSession session = request.getSession();
        if (session.getAttribute("reservation") == null) {
            response.sendRedirect("reservations-info");
            return;
        }
        request.getRequestDispatcher("/reservation-user-confirms.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        if ("confirm".equals(action)) {
            Reservation reservation = (Reservation) session.getAttribute("reservation");
            if (reservation == null) {
                System.out.println("Reservation object is null");
                response.sendRedirect("reservation-confirmation");
                return;
            }

            try {
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

                DatabaseUtils.executeUpdate(query, parameters, dbURL, dbUser, dbPassword);

                // Calculate the cost
                Customer user = (Customer) session.getAttribute("user");
                int boatLength = user.getBoatLength();
                boolean power = reservation.isPower();
                int cost = (10 * boatLength) + (power ? 10 : 0);

                // Add relevant details to the session for display in reservation-summary.jsp
                session.setAttribute("reservationMessage", "Your reservation has been confirmed successfully.");
                session.setAttribute("reservationId", reservation.getReservationId());
                session.setAttribute("slipId", reservation.getSlipId());
                session.setAttribute("checkinDate", reservation.getCheckinDate());
                session.setAttribute("checkoutDate", reservation.getCheckoutDate());
                session.setAttribute("power", reservation.isPower());
                session.setAttribute("cost", cost);

                // Also add the customer details to the session
                session.setAttribute("boatName", user.getBoatName());
                session.setAttribute("boatLength", boatLength);

                session.removeAttribute("reservation");
                response.sendRedirect("reservation-summary");
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                request.setAttribute("error", "There was an error processing your reservation. Please try again.");
                request.getRequestDispatcher("/reservation-confirmation").forward(request, response);
            }
        } else if ("cancel".equals(action)) {
            response.sendRedirect("slip-reservation");
        }
    }
}
