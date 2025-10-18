package com.emranhss.hospital.dto;

import java.util.List;

public class PatientDoctorChargeDTO {


    private Long bedBookingId;
    private String patientName;
    private int age;
    private String phone;
    private String address;
    private List<DoctorChargeDTO> charges;
    private double totalAmount;


    public Long getBedBookingId() { return bedBookingId; }
    public void setBedBookingId(Long bedBookingId) { this.bedBookingId = bedBookingId; }

    public String getPatientName() { return patientName; }
    public void setPatientName(String patientName) { this.patientName = patientName; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public List<DoctorChargeDTO> getCharges() { return charges; }
    public void setCharges(List<DoctorChargeDTO> charges) { this.charges = charges; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }
}