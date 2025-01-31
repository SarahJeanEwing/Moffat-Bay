package com.moffatbay.servlets;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

import java.io.Serial;

@WebServlet("/about")
public class AboutUsServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(jakarta.servlet.http.HttpServletRequest request,
                         jakarta.servlet.http.HttpServletResponse response)
    throws jakarta.servlet.ServletException, java.io.IOException {
        request.getRequestDispatcher("/about.jsp").forward(request, response);
    }
}
