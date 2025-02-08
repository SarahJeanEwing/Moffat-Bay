package com.moffatbay.servlets;

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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@WebServlet("/join-waitlist")
public class JoinWaitlistServlet extends HttpServlet {
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
        Customer user = (Customer) session.getAttribute("user");
        int boatSize = Integer.parseInt(request.getParameter("boat_size"));

        // Determine the appropriate slip size based on the boat size
        int slipSize;
        if (boatSize >= 1 && boatSize <= 25) {
            slipSize = 26;
        } else if (boatSize >= 26 && boatSize <= 39) {
            slipSize = 40;
        } else if (boatSize >= 40 && boatSize <= 49) {
            slipSize = 50;
        } else {
            // Handle invalid boat size
            request.setAttribute("message", "Invalid boat size.");
            request.getRequestDispatcher("/reservation-result.jsp").forward(request, response);
            return;
        }

        // Check if the user is already on the waitlist
        String existingWaitlistQuery = "SELECT * FROM waitlist WHERE customer_id = ? AND slip_size = ?";
        List<Object> existingWaitlistParams = List.of(user.getCustomerId(), slipSize);

        try {
            List<Map<String, Object>> existingWaitlistEntries = DatabaseUtils.executeQueryWithParams(existingWaitlistQuery, existingWaitlistParams, dbURL, dbUser, dbPassword);
            if (!existingWaitlistEntries.isEmpty()) {
                // User is already on the waitlist
                session.setAttribute("waitlistMessage", "You are already on the waitlist and will be contacted when there is an available slip.");
                response.sendRedirect("reservation-summary");
                return;
            }

            // Get the current date and time for the request
            LocalDateTime now = LocalDateTime.now();
            String dateOfRequest = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            boolean active = true;

            String query = "INSERT INTO waitlist (customer_id, date_of_request, active, slip_size) VALUES (?, ?, ?, ?)";
            List<Object> parameters = List.of(
                    user.getCustomerId(),
                    dateOfRequest,
                    active,
                    slipSize
            );

            DatabaseUtils.executeUpdate(query, parameters, dbURL, dbUser, dbPassword);
            session.removeAttribute("reservation");
            session.setAttribute("waitlistMessage", "You have been successfully added to the waitlist.");
            response.sendRedirect("reservation-summary");
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Database access error", e);
        }
    }
}
