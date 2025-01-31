package com.moffatbay.utils;

import java.sql.*;
import java.util.*;

public class DatabaseUtils {

    private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";

    // Load MariaDB driver
    public static void loadDriver() throws ClassNotFoundException {
        Class.forName(DB_DRIVER);
    }

    // Establish connection to the database
    public static Connection getConnection(String url, String user, String password)
            throws SQLException, ClassNotFoundException {
        loadDriver();
        return DriverManager.getConnection(url, user, password);
    }

    // Execute a SELECT query and return the results in a list of maps
    public static List<Map<String, Object>> executeQuery(String query, String url, String user, String password)
            throws SQLException, ClassNotFoundException {

        try (Connection conn = getConnection(url, user, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            List<Map<String, Object>> results = new ArrayList<>();
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();

            // Process each row in the result set
            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                for (int i = 1; i <= columnCount; i++) {
                    row.put(rsmd.getColumnName(i), rs.getObject(i));
                }
                results.add(row);
            }
            return results;
        }
    }

    // Insert a new record into the database (e.g., INSERT statement)
    public static int executeUpdate(String query, List<Object> parameters, String url, String user, String password)
            throws SQLException, ClassNotFoundException {
        try (Connection conn = getConnection(url, user, password);
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            // Set parameters for the prepared statement
            for (int i = 0; i < parameters.size(); i++) {
                pstmt.setObject(i + 1, parameters.get(i));
            }

            // Execute the update and return the number of affected rows
            return pstmt.executeUpdate();
        }
    }
}
