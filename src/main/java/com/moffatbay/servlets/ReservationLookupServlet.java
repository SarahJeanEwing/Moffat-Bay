package com.moffatbay.servlets;

import com.moffatbay.beans.Customer;
import com.moffatbay.utils.DatabaseUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.moffatbay.utils.EmailValidator;

import java.io.IOException;
import java.io.Serial;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Objects;


@WebServlet("/reservation_lookup")
public class ReservationLookupServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
    private String email;
    private String reservationId;
    private String customerId;
    private String dbURL;
    private String dbUser;
    private String dbPassword;

    @Override
    public void init() {
        dbURL = getInitParameter("dbURL");
        dbUser = getInitParameter("dbUser");
        dbPassword = getInitParameter("dbPassword");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/reservation-lookup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String lookUp = request.getParameter("lookup");

        if (EmailValidator.isValidEmail(lookUp)) {
            email = lookUp;
            customerId = String.valueOf(Objects.requireNonNull(getCustomerByEmail(email)).getCustomerId());
        } else {
            reservationId = lookUp;
        }
        request.setAttribute("email", email);
        request.setAttribute("reservationId", reservationId);
        request.setAttribute("customerId", customerId);
        request.getRequestDispatcher("/reservation-lookup.jsp").forward(request, response);

    }

    private Customer getCustomerByEmail(String email) {
        String query = "SELECT customer_id FROM customers WHERE email = ?";
        List<Object> parameters = List.of(email);

        try {
            List<Map<String, Object>> results = DatabaseUtils.executeQueryWithParams(query, parameters, dbURL, dbUser, dbPassword);
            if (!results.isEmpty()) {
                Map<String, Object> row = results.getFirst();
                Customer customer = new Customer();
                customer.setCustomerId((Integer) row.get("customer_id"));
                return customer;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }



}
