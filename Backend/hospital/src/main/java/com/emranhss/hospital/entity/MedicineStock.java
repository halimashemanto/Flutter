package com.emranhss.hospital.entity;

import jakarta.persistence.*;

import java.util.Date;



@Entity
@Table(name = "medicineStocks")
public class MedicineStock {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "pharmacyMedicine_id")
    private PharmacyMedicine medicine;

    private String batchNo;
    private Date expiryDate;
    private int quantity;
    private double purchasePrice;
    private Date createdAt;

    public MedicineStock() {}

    public MedicineStock(Long id, PharmacyMedicine medicine, String batchNo, Date expiryDate, int quantity, double purchasePrice, Date createdAt) {
        this.id = id;
        this.medicine = medicine;
        this.batchNo = batchNo;
        this.expiryDate = expiryDate;
        this.quantity = quantity;
        this.purchasePrice = purchasePrice;
        this.createdAt = createdAt;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public PharmacyMedicine getMedicine() {
        return medicine;
    }

    public void setMedicine(PharmacyMedicine medicine) {
        this.medicine = medicine;
    }

    public String getBatchNo() {
        return batchNo;
    }

    public void setBatchNo(String batchNo) {
        this.batchNo = batchNo;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPurchasePrice() {
        return purchasePrice;
    }

    public void setPurchasePrice(double purchasePrice) {
        this.purchasePrice = purchasePrice;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}
