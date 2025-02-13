package com.moffatbay.utils;

import com.moffatbay.beans.Customer;
import com.moffatbay.beans.Reservation;

import java.sql.*;
import java.util.*;

public class DatabaseUtils {

    private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String DB_URL = "jdbc:mysql://localhost:3306/moffat-bay"; // Move the DB parameters here
    private static final String DB_USER = "dbadmin";
    private static final String DB_PASSWORD = "master01";

    // Load MariaDB driver
    public static void loadDriver() throws ClassNotFoundException {
        Class.forName(DB_DRIVER);
    }

    // Establish connection to the database
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        loadDriver();
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    // Execute a SELECT query with parameters and return the results in a list of maps
    public static List<Map<String, Object>> executeQueryWithParams(String query, List<Object> parameters)
            throws SQLException, ClassNotFoundException {
        List<Map<String, Object>> results = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            // Set parameters for the prepared statement
            for (int i = 0; i < parameters.size(); i++) {
                pstmt.setObject(i + 1, parameters.get(i));
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                ResultSetMetaData rsmd = rs.getMetaData();
                int columnCount = rsmd.getColumnCount();

                while (rs.next()) {
                    Map<String, Object> row = new HashMap<>();
                    for (int i = 1; i <= columnCount; i++) {
                        row.put(rsmd.getColumnName(i), rs.getObject(i));
                    }
                    results.add(row);
                }
            }
        }
        return results;
    }

    // Method to get customer by email
    public static Customer getCustomerByEmail(String email) {
        String query = "SELECT * FROM customers WHERE email = ?";
        List<Object> parameters = List.of(email);

        try {
            List<Map<String, Object>> results = executeQueryWithParams(query, parameters);
            if (!results.isEmpty()) {
                Map<String, Object> row = results.get(0);
                Customer customer = new Customer();
                customer.setCustomerId((Integer) row.get("customer_id"));
                customer.setEmail((String) row.get("email"));
                customer.setFirstName((String) row.get("first_name"));
                customer.setLastName((String) row.get("last_name"));
                customer.setTelephone((String) row.get("telephone"));
                customer.setBoatName((String) row.get("boat_name"));
                customer.setBoatLength((Integer) row.get("boat_length"));
                customer.setPassword((String) row.get("password"));
                return customer;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Method to get reservation for a customer
    public static Reservation getReservationForCustomer(int customerId) {
        String query = "SELECT * FROM reservations WHERE customer_id = ? AND active = true";
        List<Object> parameters = List.of(customerId);

        try {
            List<Map<String, Object>> results = executeQueryWithParams(query, parameters);
            if (!results.isEmpty()) {
                Map<String, Object> row = results.get(0);
                Reservation reservation = new Reservation();
                reservation.setReservationId((String) row.get("reservation_id"));
                reservation.setSlipId((Integer) row.get("slip_id"));
                reservation.setCheckinDate((java.sql.Date) row.get("checkin_date"));
                reservation.setCheckoutDate((java.sql.Date) row.get("checkout_date"));
                reservation.setActive((Boolean) row.get("active"));
                reservation.setPower((Boolean) row.get("power"));
                return reservation;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void executeUpdate(String query, List<Object> parameters) throws SQLException, ClassNotFoundException {

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            // Set Parameters in the PreparedStatement
            for (int i = 0; i < parameters.size(); i++) {
                pstmt.setObject(i + 1, parameters.get(i));
            }

            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error executing query: " + query, e);
        } catch (ClassNotFoundException e) {
            throw new ClassNotFoundException("Error loading database driver", e);
        } catch (Exception e) {
            throw new RuntimeException("Error executing query: " + query, e);
        }

    }

    public static Reservation getReservation(String reservationId) {
        String query = "SELECT * FROM reservations WHERE reservation_id = ? AND active = true";
        List<Object> parameters = List.of(reservationId);

        try {
            List<Map<String, Object>> results = executeQueryWithParams(query, parameters);
            if (!results.isEmpty()) {
                Map<String, Object> row = results.get(0);
                Reservation reservation = new Reservation();
                reservation.setReservationId((String) row.get("reservation_id"));
                reservation.setSlipId((Integer) row.get("slip_id"));
                reservation.setCheckinDate((java.sql.Date) row.get("checkin_date"));
                reservation.setCheckoutDate((java.sql.Date) row.get("checkout_date"));
                reservation.setActive((Boolean) row.get("active"));
                reservation.setPower((Boolean) row.get("power"));
                return reservation;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
}