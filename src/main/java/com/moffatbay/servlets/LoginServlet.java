package com.moffatbay.servlets;

import com.moffatbay.beans.Reservation;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.moffatbay.beans.Customer;
import com.moffatbay.utils.DatabaseUtils;
import com.moffatbay.utils.PasswordHash;

import java.io.IOException;
import java.io.Serial;
import java.security.NoSuchAlgorithmException;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Customer customer = (Customer) DatabaseUtils.getCustomerByEmail(email);

        try {
            if (customer != null && PasswordHash.checkPassword(password, customer.getPassword())) {
                HttpSession session = request.getSession();
                session.setAttribute("user", customer);

                // Retrieve reservation details for the logged-in customer
                Reservation reservation = DatabaseUtils.getReservationForCustomer(customer.getCustomerId());

                if (reservation != null) {
                    session.setAttribute("reservation", reservation);
                }

                // Check for redirectAfterLogin attribute
                String redirectAfterLogin = (String) session.getAttribute("redirectAfterLogin");
                if (redirectAfterLogin != null) {
                    session.removeAttribute("redirectAfterLogin");
                    response.sendRedirect(redirectAfterLogin);
                } else {
                    response.sendRedirect("my_account"); // Default redirect after login
                }

            } else {
                request.setAttribute("errorMessage", "Invalid email or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    /* private Reservation getReservationForCustomer(int customerId) {
        String query = "SELECT * FROM reservations WHERE customer_id = ? AND active = true";
        List<Object> parameters = List.of(customerId);

        try {
            List<Map<String, Object>> results = DatabaseUtils.executeQueryWithParams(query, parameters, dbURL, dbUser, dbPassword);
            if (!results.isEmpty()) {
                Map<String, Object> row = results.getFirst();
                Reservation reservation = new Reservation();
                reservation.setReservationId((String) row.get("reservation_id"));
                reservation.setSlipId((Integer) row.get("slip_id"));
                reservation.setCheckinDate((java.sql.Date) row.get("checkin_date"));
                reservation.setCheckoutDate((java.sql.Date) row.get("checkout_date"));
                reservation.setActive((Boolean) row.get("active"));
                reservation.setPower((Boolean) row.get("power"));
                return reservation;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    } */
}