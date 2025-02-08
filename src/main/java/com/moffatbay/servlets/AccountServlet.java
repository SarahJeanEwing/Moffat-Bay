package com.moffatbay.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.moffatbay.beans.Customer;
import com.moffatbay.beans.Reservation;

import java.io.IOException;
import java.io.Serial;

@WebServlet("/my_account")
public class AccountServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer user = (Customer) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        request.setAttribute("firstName", user.getFirstName());
        request.setAttribute("lastName", user.getLastName());
        request.setAttribute("email", user.getEmail());
        request.setAttribute("telephone", user.getTelephone());
        request.setAttribute("boatName", user.getBoatName());
        request.setAttribute("boatLength", user.getBoatLength());

        request.getRequestDispatcher("/account.jsp").forward(request, response);
    }
}
