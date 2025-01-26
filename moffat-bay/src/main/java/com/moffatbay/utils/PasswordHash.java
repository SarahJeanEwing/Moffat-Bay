package com.moffatbay.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordHash {

    public static void main(String[] args) {
        String password = "password";
        try {
            String hashedPassword = hashPassword(password);
            System.out.println("Hashed Password: " + hashedPassword);

            boolean isMatch = checkPassword(password, hashedPassword);
            System.out.println("Password match: " + isMatch);
        } catch (NoSuchAlgorithmException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
    
    public static String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] encodedHash = digest.digest(password.getBytes());

        // Convert byte array to a hexadecimal string
        StringBuilder hexString = new StringBuilder(2 * encodedHash.length);
        for (byte b : encodedHash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }

    public static boolean checkPassword(String password, String hashedPassword) throws NoSuchAlgorithmException {
        String hashOfInput = hashPassword(password);
        return hashedPassword.equals(hashOfInput);
    }
}
