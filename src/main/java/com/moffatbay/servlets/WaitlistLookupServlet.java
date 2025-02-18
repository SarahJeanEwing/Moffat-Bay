package com.moffatbay.servlets;

import com.moffatbay.utils.DatabaseUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.Serial;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/waitlist")
public class WaitlistLookupServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    private static final int[] SLIP_SIZES = {26, 40, 50};

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Map<Integer, Integer> customersInLineMap = new HashMap<>();

        try {
            for (int size : SLIP_SIZES) {
                int availableSlips = DatabaseUtils.getAvailableSlipsCountBySize(size);
                int waitlistCount = DatabaseUtils.getWaitlistCountBySlipSize(size);

                int customersInLine = (availableSlips == 0) ? waitlistCount : 0;

                customersInLineMap.put(size, customersInLine);
            }

            request.setAttribute("customersInLineMap", customersInLineMap);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while retrieving waitlist data.");
        }

        request.getRequestDispatcher("/waitlist-lookup.jsp").forward(request, response);
    }
}
