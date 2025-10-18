package com.emranhss.hospital.entity;


import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "doctorCharges")
public class DoctorCharge {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String description;
    private double amount;
    private Date visitDate ;


    @ManyToOne
    @JoinColumn(name = "doctor_id")
    private Doctor doctor;

    @ManyToOne
    @JoinColumn(name = "bed_booking_id")
    private BedBooking bedBooking;

    @ManyToOne
    @JoinColumn(name = "admitted_patient_id")
    private AdmittedPatient admittedPatient;


    public DoctorCharge(Long id, String description, double amount, Date visitDate, Doctor doctor, BedBooking bedBooking, AdmittedPatient admittedPatient) {
        this.id = id;
        this.description = description;
        this.amount = amount;
        this.visitDate = visitDate;
        this.doctor = doctor;
        this.bedBooking = bedBooking;
        this.admittedPatient = admittedPatient;
    }

    public DoctorCharge() {}

    public Date getVisitDate() {
        return visitDate;
    }

    public void setVisitDate(Date visitDate) {
        this.visitDate = visitDate;
    }

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

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public BedBooking getBedBooking() {
        return bedBooking;
    }

    public void setBedBooking(BedBooking bedBooking) {
        this.bedBooking = bedBooking;
    }

    public AdmittedPatient getAdmittedPatient() {
        return admittedPatient;
    }

    public void setAdmittedPatient(AdmittedPatient admittedPatient) {
        this.admittedPatient = admittedPatient;
    }
}
