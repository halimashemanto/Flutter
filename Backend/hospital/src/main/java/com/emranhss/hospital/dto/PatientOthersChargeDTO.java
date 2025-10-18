package com.emranhss.hospital.dto;

import java.util.List;

public class PatientOthersChargeDTO {

    private Long bedBookingId;
    private String patientName;
    private int age;
    private String phone;
    private String address;
    private List<OthersChargeDTO> charges;
    private double totalAmount;

    public Long getBedBookingId() {
        return bedBookingId;
    }

    public void setBedBookingId(Long bedBookingId) {
        this.bedBookingId = bedBookingId;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<OthersChargeDTO> getCharges() {
        return charges;
    }

    public void setCharges(List<OthersChargeDTO> charges) {
        this.charges = charges;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }
}
