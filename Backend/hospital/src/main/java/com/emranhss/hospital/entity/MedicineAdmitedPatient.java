package com.emranhss.hospital.entity;


import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "medicineAdmitedPatient")
public class MedicineAdmitedPatient {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String applyWay;
    private int quantity;
    private Date date;

    @Column(name = "medicine_cost", nullable = false)
    private double totalCost;


    @ManyToOne
    @JoinColumn(name = "pharmacy_medicine_id")
    private PharmacyMedicine pharmacyMedicine;


    @ManyToOne
    @JoinColumn(name = "bed_booking_id")
    private BedBooking bedBooking;


    @ManyToOne
    @JoinColumn(name = "admitted_patient_id")
    private AdmittedPatient admittedPatient;

    public MedicineAdmitedPatient() {}

    public MedicineAdmitedPatient(Long id, String applyWay, int quantity, Date date, double totalCost, PharmacyMedicine pharmacyMedicine, BedBooking bedBooking, AdmittedPatient admittedPatient) {
        this.id = id;
        this.applyWay = applyWay;
        this.quantity = quantity;
        this.date = date;
        this.totalCost = totalCost;
        this.pharmacyMedicine = pharmacyMedicine;
        this.bedBooking = bedBooking;
        this.admittedPatient = admittedPatient;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getApplyWay() {
        return applyWay;
    }

    public void setApplyWay(String applyWay) {
        this.applyWay = applyWay;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getTotalCost() { return totalCost; }
    public void setTotalCost(double totalCost) { this.totalCost = totalCost; }


    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }


    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public PharmacyMedicine getPharmacyMedicine() {
        return pharmacyMedicine;
    }

    public void setPharmacyMedicine(PharmacyMedicine pharmacyMedicine) {
        this.pharmacyMedicine = pharmacyMedicine;
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