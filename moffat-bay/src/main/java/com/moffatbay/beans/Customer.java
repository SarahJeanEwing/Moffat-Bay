package com.moffatbay.beans;

public class Customer {
    private int customerId;
    private String email;
    private String firstName;
    private String lastName;
    private String telephone;
    private String boatName;
    private int boatLength;
    private String password;

    // Constructors
    public Customer() {}

    public Customer(int customerId, String email, String firstName,
                    String lastName, String telephone, String boatName,
                    int boatLength, String password) {
        this.customerId = customerId;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.telephone = telephone;
        this.boatName = boatName;
        this.boatLength = boatLength;
        this.password = password;
    }

    // Getter and Setters

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getBoatName() {
        return boatName;
    }

    public void setBoatName(String boatName) {
        this.boatName = boatName;
    }

    public int getBoatLength() {
        return boatLength;
    }

    public void setBoatLength(int boatLength) {
        this.boatLength = boatLength;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
