package com.moffatbay.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/reserve-now")
public class ReserveNowServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            // If user is not logged in, save the original URL and redirect to login
            session.setAttribute("redirectAfterLogin", "slip-reservation");
            response.sendRedirect("login");
        } else {
            // if user is logged in, redirect to slip reservation page
            response.sendRedirect("slip-reservation");
        }
    }
}
