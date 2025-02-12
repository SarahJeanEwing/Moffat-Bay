package com.moffatbay.beans;

import com.moffatbay.utils.DatabaseUtils;
import java.security.SecureRandom;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class Reservation {
    private String reservationId;
    private int customerId;
    private int slipId;
    private Date checkinDate;
    private Date checkoutDate;
    private boolean active;
    private boolean power;

    public Reservation() {
        this.reservationId = generateUniqueReservationID();
    }

    private String generateUniqueReservationID() {
        String reservationID;
        do {
            reservationID = generateRandomReservationID();
        } while (reservationIDExists(reservationID));
        return reservationID;
    }

    private String generateRandomReservationID() {
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder();
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

        for (int i = 0; i < 8; i++) {
            sb.append(characters.charAt(random.nextInt(characters.length())));
        }
        return sb.toString();
    }

    private boolean reservationIDExists(String reservationId) {
        String query = "SELECT COUNT(*) AS count FROM reservations WHERE reservation_id = ?";
        List<Object> parameters = List.of(reservationId);

        try {
            List<Map<String, Object>> results = DatabaseUtils.executeQueryWithParams(query, parameters);
            if (!results.isEmpty()) {
                Map<String, Object> row = results.get(0);
                long count = (long) row.get("count");
                return count > 0;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Getters and Setters
    public String getReservationId() {
        return reservationId;
    }

    public void setReservationId(String reservationId) {
        this.reservationId = reservationId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getSlipId() {
        return slipId;
    }

    public void setSlipId(int slipId) {
        this.slipId = slipId;
    }

    public Date getCheckinDate() {
        return checkinDate;
    }

    public void setCheckinDate(Date checkinDate) {
        this.checkinDate = checkinDate;
    }

    public Date getCheckoutDate() {
        return checkoutDate;
    }

    public void setCheckoutDate(Date checkoutDate) {
        this.checkoutDate = checkoutDate;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public boolean isPower() {
        return power;
    }

    public void setPower(boolean power) {
        this.power = power;
    }

    @Override
    public String toString() {
        return "Reservation{" +
                "reservationId='" + reservationId + '\'' +
                ", customerId=" + customerId +
                ", slipId=" + slipId +
                ", checkinDate=" + checkinDate +
                ", checkoutDate=" + checkoutDate +
                ", active=" + active +
                ", power=" + power +
                '}';
    }
}
