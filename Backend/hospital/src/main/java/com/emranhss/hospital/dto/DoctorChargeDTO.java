package com.emranhss.hospital.dto;

import java.util.Date;

public class DoctorChargeDTO {


    private Long id;
    private String description;
    private double amount;
    private Long bedBookingId;
    private Long doctorId;
    private Date visitDate;

    public DoctorChargeDTO() {
    }

    public DoctorChargeDTO(Long id, String description, double amount, Long bedBookingId, Long doctorId, Date visitDate) {
        this.id = id;
        this.description = description;
        this.amount = amount;
        this.bedBookingId = bedBookingId;
        this.doctorId = doctorId;
        this.visitDate = visitDate;
    }

    // Getters & Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Long getBedBookingId() {
        return bedBookingId;
    }

    public void setBedBookingId(Long bedBookingId) {
        this.bedBookingId = bedBookingId;
    }

    public Long getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(Long doctorId) {
        this.doctorId = doctorId;
    }

    public Date getVisitDate() {
        return visitDate;
    }

    public void setVisitDate(Date visitDate) {
        this.visitDate = visitDate;
    }
}