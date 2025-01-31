package com.moffatbay.servlets;

import com.moffatbay.utils.PasswordHash;
import com.moffatbay.beans.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get email from login page
    	String email = request.getParameter("email");
    	// get password from login page
        String password = request.getParameter("password");

        // get customer details and hashed password database
        Customer loggedInUser = getCustomerByEmail(email);
        String storedHashedPassword;
        if (loggedInUser != null) {
            storedHashedPassword = loggedInUser.getPassword();
        } else {
            storedHashedPassword = null;
        }

        try {
        	// check if password entered matches stored hashed password
            if (storedHashedPassword != null && PasswordHash.checkPassword(password, storedHashedPassword)) {
                // Password matches
                HttpSession session = request.getSession();
                session.setAttribute("user", loggedInUser);

                // redirect to home page after registration
                response.sendRedirect("home.jsp");
                
            } else {
                // Handle incorrect password
                request.setAttribute("errorMessage", "Invalid email or password");
                request.getRequestDispatcher("registration.jsp").forward(request, response);
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred during login");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private Customer getCustomerByEmail(String email) {
        // To do - add code to retrieve customer from database, replace with actual retrieval logic
        return null;
    }
}

