package com.moffatbay.servlets;

import com.moffatbay.beans.Customer;
import com.moffatbay.beans.Reservation;
import com.moffatbay.utils.DatabaseUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.moffatbay.utils.EmailValidator;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;
import java.io.Serial;

import static com.moffatbay.utils.DatabaseUtils.getReservationForCustomer;


@WebServlet("/reservation_lookup")
public class ReservationLookupServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
    private static String reservationId;



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/reservation-lookup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String lookUp = request.getParameter("lookUp");

        if (EmailValidator.isValidEmail(lookUp)) {
            Customer customer = DatabaseUtils.getCustomerByEmail(lookUp);
            try {
                if (customer != null) {
                    HttpSession session = request.getSession();
                    request.setAttribute("user", customer);

                    // Retrieve reservation details for the logged-in customer
                    Reservation reservation = getReservationForCustomer(customer.getCustomerId());

                    if (reservation != null) {
                        session.setAttribute("reservation", reservation);
                    }
                } else {
                    request.setAttribute("errorMessage", "Customer not found for email: " + lookUp);
                    request.setAttribute("email", lookUp);
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                }

            } catch (ServletException | IOException e){
                e.printStackTrace();
            }
        } else {
            reservationId = lookUp;
            Reservation reservation = DatabaseUtils.getReservation(reservationId);
            if (reservation != null) {
                request.setAttribute("reservation", reservation);
            }
        }

        request.getRequestDispatcher("/reservation-details.jsp").forward(request, response);

    }



}
