package com.emranhss.hospital.entity;


import jakarta.persistence.*;

@Entity
@Table(name = "othersCharges")
public class OthersCharge {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String description;
    private double amount;

    @ManyToOne
    @JoinColumn(name = "bed_booking_id")
    private BedBooking bedBooking;

    @ManyToOne
    @JoinColumn(name = "admitted_patient_id")
    private AdmittedPatient admittedPatient;

    public OthersCharge() {
    }

    public OthersCharge(Long id, String description, double amount, BedBooking bedBooking, AdmittedPatient admittedPatient) {
        this.id = id;
        this.description = description;
        this.amount = amount;
        this.bedBooking = bedBooking;
        this.admittedPatient = admittedPatient;
    }

    public BedBooking getBedBooking() {
        return bedBooking;
    }

    public void setBedBooking(BedBooking bedBooking) {
        this.bedBooking = bedBooking;
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

    public AdmittedPatient getAdmittedPatient() {
        return admittedPatient;
    }

    public void setAdmittedPatient(AdmittedPatient admittedPatient) {
        this.admittedPatient = admittedPatient;
    }
}
