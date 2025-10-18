package com.emranhss.hospital.dto;

import java.util.Date;

public class MedicineAdmitedPatientDTO {


    private Long id;
    private String medicineName;
    private double sellingPrice;
    private String applyWay;
    private int quantity;
    private double totalCost;
    private Date date;
    private Long bedBookingId;
    private Long pharmacyMedicineId;

    public MedicineAdmitedPatientDTO() {}

    public MedicineAdmitedPatientDTO(Long id, String medicineName, double sellingPrice, String applyWay, int quantity, double totalCost, Date date, Long bedBookingId, Long pharmacyMedicineId) {
        this.id = id;
        this.medicineName = medicineName;
        this.sellingPrice = sellingPrice;
        this.applyWay = applyWay;
        this.quantity = quantity;
        this.totalCost = totalCost;
        this.date = date;
        this.bedBookingId = bedBookingId;
        this.pharmacyMedicineId = pharmacyMedicineId;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPharmacyMedicineId() {
        return pharmacyMedicineId;
    }

    public void setPharmacyMedicineId(Long pharmacyMedicineId) {
        this.pharmacyMedicineId = pharmacyMedicineId;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    public double getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(double sellingPrice) {
        this.sellingPrice = sellingPrice;
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

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Long getBedBookingId() {
        return bedBookingId;
    }

    public void setBedBookingId(Long bedBookingId) {
        this.bedBookingId = bedBookingId;
    }
}
