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
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Map;

@WebServlet("/slip-reservation")
public class SlipReservationServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/slip-reservation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String checkinDateStr = request.getParameter("checkInDate");
        String checkoutDateStr = request.getParameter("checkOutDate");
        int boatSize = Integer.parseInt(request.getParameter("hiddenBoatLength"));
        boolean power = "yes".equals(request.getParameter("requiresPower"));

        LocalDate checkinDate = LocalDate.parse(checkinDateStr);
        LocalDate checkoutDate = LocalDate.parse(checkoutDateStr);
        LocalDate today = LocalDate.now();

        HttpSession session = request.getSession();
        Customer user = (Customer) session.getAttribute("user");
        int customerId = user.getCustomerId();

        // Store the form data in session for redisplay
        session.setAttribute("prevCheckinDate", checkinDateStr);
        session.setAttribute("prevCheckoutDate", checkoutDateStr);
        session.setAttribute("prevRequiresPower", power ? "yes" : "no");

        // Check if check-in date is after today's date
        if (!checkinDate.isAfter(today)) {
            session.setAttribute("message", "Check-in date needs to be after today's date.");
            response.sendRedirect("slip-reservation");
            return;
        }

        // Check if checkin_date is before checkout_date
        if (!checkinDate.isBefore(checkoutDate)) {
            session.setAttribute("message", "Check-in date must be before check-out date.");
            response.sendRedirect("slip-reservation");
            return;
        }

        // Check if the duration between checkin_date and checkout_date is at least 3 months
        if (ChronoUnit.MONTHS.between(checkinDate, checkoutDate) < 3) {
            session.setAttribute("message", "Slip Reservations must be 3 months or longer.");
            response.sendRedirect("slip-reservation");
            return;
        }

        // Check if a reservation already exists within the date range
        String existingReservationQuery = "SELECT * FROM reservations WHERE customer_id = ? AND ((checkin_date < ? AND checkout_date > ?) OR (checkin_date < ? AND checkout_date > ?) OR (checkin_date >= ? AND checkout_date <= ?))";
        List<Object> existingReservationParams = List.of(customerId, checkoutDateStr, checkinDateStr, checkinDateStr, checkoutDateStr, checkinDateStr, checkoutDateStr);

        try {
            List<Map<String, Object>> existingReservations = DatabaseUtils.executeQueryWithParams(existingReservationQuery, existingReservationParams);
            if (!existingReservations.isEmpty()) {
                // Reservation already exists within the date range
                session.setAttribute("reservationStatus", "exists");
                response.sendRedirect("reservation-confirmation");
                return;
            }

            String query = "SELECT bs.* FROM boat_slips bs " +
                    "LEFT JOIN (SELECT slip_id FROM reservations WHERE checkin_date < ? OR checkout_date > ?) AS r " +
                    "ON bs.slip_id = r.slip_id " +
                    "WHERE r.slip_id IS NULL AND (" +
                    "(bs.slip_size = 26 AND ? BETWEEN 1 AND 25) OR " +
                    "(bs.slip_size = 40 AND ? BETWEEN 26 AND 39) OR " +
                    "(bs.slip_size = 50 AND ? BETWEEN 40 AND 49))";
            List<Object> parameters = List.of(checkoutDateStr, checkinDateStr, boatSize, boatSize, boatSize);

            List<Map<String, Object>> results = DatabaseUtils.executeQueryWithParams(query, parameters);
            if (!results.isEmpty()) {
                // Create Reservation object
                Reservation reservation = new Reservation();
                reservation.setCustomerId(customerId);
                reservation.setSlipId((Integer) results.get(0).get("slip_id")); // Use the first available slip_id
                reservation.setCheckinDate(Date.valueOf(checkinDateStr));
                reservation.setCheckoutDate(Date.valueOf(checkoutDateStr));
                reservation.setActive(true);
                reservation.setPower(power);

                // Calculate the cost
                int cost = (10 * boatSize) + (power ? 10 : 0);

                // Store the reservation object and cost in the session for the next screen
                session.setAttribute("reservation", reservation);
                session.setAttribute("reservationStatus", "available");
                session.setAttribute("cost", cost);
            } else {
                session.setAttribute("reservationStatus", "waitlist");
            }

            // Redirect to the reservation confirmation page
            response.sendRedirect("reservation-confirmation");
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Database access error", e);
        }
    }
}
