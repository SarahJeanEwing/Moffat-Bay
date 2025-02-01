package com.moffatbay.servlets;

import com.moffatbay.utils.PasswordHash;
import com.moffatbay.utils.DatabaseUtils;
import com.moffatbay.beans.Customer;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.Serial;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@WebServlet("/login") // Make sure this URL matches your form action
public class LoginServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
    private String dbURL;
    private String dbUser;
    private String dbPassword;

    @Override
    public void init() throws ServletException {
        ServletContext context = getServletContext();
        dbURL = context.getInitParameter("dbName");
        dbUser = context.getInitParameter("dbUser");
        dbPassword = context.getInitParameter("dbPass");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Customer loggedInUser = getCustomerByEmail(email);
        String storedHashedPassword = (loggedInUser != null) ? loggedInUser.getPassword() : null;

        try {
            if (storedHashedPassword != null) {

                if (PasswordHash.checkPassword(password, storedHashedPassword)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", loggedInUser);
                    response.sendRedirect("account.jsp");
                } else {
                    request.setAttribute("errorMessage", "Invalid email or password");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorMessage", "Invalid email or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred during login");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private Customer getCustomerByEmail(String email) {
        String query = "SELECT customer_id, email, first_name, last_name, telephone, boat_name, boat_length, password FROM customers WHERE email = ?";
        List<Object> parameters = Arrays.asList(email);

        try {
            List<Map<String, Object>> results = DatabaseUtils.executeQueryWithParams(query, parameters, dbURL, dbUser, dbPassword);

            if (!results.isEmpty()) {
                Map<String, Object> row = results.get(0);
                Customer customer = new Customer();
                customer.setCustomerId(row.get("customer_id") != null ? ((Integer) row.get("customer_id")) : 0);
                customer.setEmail((String) row.get("email"));
                customer.setFirstName((String) row.get("first_name"));
                customer.setLastName((String) row.get("last_name"));
                customer.setTelephone((String) row.get("telephone"));
                customer.setBoatName((String) row.get("boat_name"));
                customer.setBoatLength(row.get("boat_length") != null ? ((Integer) row.get("boat_length")) : 0);
                customer.setPassword((String) row.get("password"));
                return customer;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

}
