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

@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/registration.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String telephone = request.getParameter("telephone");
        String boatName = request.getParameter("boatName");
        int boatLength = Integer.parseInt(request.getParameter("boatLength"));
        String password = request.getParameter("password");

        try {
            String hashedPassword = PasswordHash.hashPassword(password);

            // Create a new Customer object
            Customer newCustomer = new Customer();
            newCustomer.setEmail(email);
            newCustomer.setFirstName(firstName);
            newCustomer.setLastName(lastName);
            newCustomer.setTelephone(telephone);
            newCustomer.setBoatName(boatName);
            newCustomer.setBoatLength(boatLength);
            newCustomer.setPassword(hashedPassword);

            // Save the new customer to the database
            saveCustomer(newCustomer);

            // Create a session and set the new customer as the user
            HttpSession session = request.getSession();
            session.setAttribute("user", newCustomer);
            
            // redirect to home page after registration
            response.sendRedirect("home.jsp");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred during registration");
            request.getRequestDispatcher("registration.jsp").forward(request, response);
        }
    }

    private void saveCustomer(Customer customer) {
        // Add code to save customer to database
    }
}
