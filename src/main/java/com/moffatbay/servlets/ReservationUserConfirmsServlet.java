package com.moffatbay.servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Reservation-Confirmation")
public class ReservationUserConfirmsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        if ("confirm".equals(action)) {
            // Generate a confirmation number (dummy example)
            String confirmationNumber = "CONF" + System.currentTimeMillis();
            session.setAttribute("confirmationNumber", confirmationNumber);
            response.sendRedirect("confirmation_page.jsp");
        } else if ("cancel".equals(action)) {
            response.sendRedirect("boat_slip_info.jsp");
        }
    }
}
