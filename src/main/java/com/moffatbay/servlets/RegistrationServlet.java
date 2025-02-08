package com.moffatbay.servlets;

import com.moffatbay.beans.Customer;
import com.moffatbay.utils.PasswordHash;
import com.moffatbay.utils.DatabaseUtils;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet {
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
        request.getRequestDispatcher("/registration.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String telephone = request.getParameter("telephone");
        String boatName = request.getParameter("boatName");
        int boatLength = Integer.parseInt(request.getParameter("boatLength"));
        String password = request.getParameter("password");

        // Check if email already exists
        if (emailExists(email)) {
            request.setAttribute("errorMessage", "There is already an account with this email address. <a href=\"login.jsp\">Log in instead</a>.");
            request.getRequestDispatcher("registration.jsp").forward(request, response);
            return;
        }

        // Validate the password
        if (!isValidPassword(password)) {
            request.setAttribute("errorMessage", "Password must be at least 8 characters long, and include at least one uppercase letter and one lowercase letter.");
            request.getRequestDispatcher("registration.jsp").forward(request, response);
            return;
        }

        // Hash the password
        String hashedPassword;
        try {
            hashedPassword = PasswordHash.hashPassword(password);
        } catch (NoSuchAlgorithmException e) {
            throw new ServletException("Error hashing password", e);
        }

        // Create a new Customer object
        Customer customer = new Customer(0, email, firstName, lastName, telephone, boatName, boatLength, hashedPassword);

        // Insert the new customer into the database
        String query = "INSERT INTO customers (email, first_name, last_name, telephone, boat_name, boat_length, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
        List<Object> parameters = new ArrayList<>();
        parameters.add(email);
        parameters.add(firstName);
        parameters.add(lastName);
        parameters.add(telephone);
        parameters.add(boatName);
        parameters.add(boatLength);
        parameters.add(hashedPassword);

        try {
            DatabaseUtils.executeUpdate(query, parameters, dbURL, dbUser, dbPassword);
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Error inserting customer into database", e);
        }

        // Set session attribute
        HttpSession session = request.getSession();
        session.setAttribute("user", customer);

        // Check for redirectAfterLogin attribute
        String redirectAfterLogin = (String) session.getAttribute("redirectAfterLogin");
        if (redirectAfterLogin != null) {
            session.removeAttribute("redirectAfterLogin");
            response.sendRedirect(redirectAfterLogin);
        } else {
            response.sendRedirect("my_account"); // Default redirect after registration
        }
    }

    private boolean emailExists(String email) {
        String query = "SELECT COUNT(*) FROM customers WHERE email = ?";
        List<Object> parameters = List.of(email);

        try {
            List<Map<String, Object>> results = DatabaseUtils.executeQueryWithParams(query, parameters, dbURL, dbUser, dbPassword);
            if (!results.isEmpty() && ((Long) results.get(0).get("COUNT(*)")) > 0) {
                return true;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    private boolean isValidPassword(String password) {
        if (password.length() < 8) {
            return false;
        }
        boolean hasUppercase = false;
        boolean hasLowercase = false;
        for (char c : password.toCharArray()) {
            if (Character.isUpperCase(c)) {
                hasUppercase = true;
            }
            if (Character.isLowerCase(c)) {
                hasLowercase = true;
            }
        }
        return hasUppercase && hasLowercase;
    }
}