package com.emranhss.hospital.dto;

import java.util.Date;

public class BedBookingDTO {

    private Long bedId;
    private String patientName;
    private int age;
    private String phone;
    private String address;
    private String broughtBy;
    private Date admissionDate;
    private Date dischargeDate;
    private double totalCharge;

    public BedBookingDTO() {}

    public Long getBedId() { return bedId; }
    public void setBedId(Long bedId) { this.bedId = bedId; }

    public String getPatientName() { return patientName; }
    public void setPatientName(String patientName) { this.patientName = patientName; }

    public Date getAdmissionDate() { return admissionDate; }
    public void setAdmissionDate(Date admissionDate) { this.admissionDate = admissionDate; }

    public Date getDischargeDate() { return dischargeDate; }
    public void setDischargeDate(Date dischargeDate) { this.dischargeDate = dischargeDate; }

    public double getTotalCharge() { return totalCharge; }
    public void setTotalCharge(double totalCharge) { this.totalCharge = totalCharge; }

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

    public String getBroughtBy() {
        return broughtBy;
    }

    public void setBroughtBy(String broughtBy) {
        this.broughtBy = broughtBy;
    }
}
