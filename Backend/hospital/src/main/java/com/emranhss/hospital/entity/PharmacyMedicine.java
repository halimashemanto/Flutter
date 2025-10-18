package com.emranhss.hospital.entity;

import jakarta.persistence.*;

import java.util.Date;


@Entity
@Table(name = "pharmacyMedicines")
public class PharmacyMedicine {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String genericName;
    private String strength;
    private String unit;
    private String sku;
    private double sellingPrice;

    private Date createdAt;

    public PharmacyMedicine() {}

    public PharmacyMedicine(Long id, String name, String genericName, String strength, String unit, String sku, double sellingPrice, Date createdAt) {
        this.id = id;
        this.name = name;
        this.genericName = genericName;
        this.strength = strength;
        this.unit = unit;
        this.sku = sku;
        this.sellingPrice = sellingPrice;
        this.createdAt = createdAt;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGenericName() {
        return genericName;
    }

    public void setGenericName(String genericName) {
        this.genericName = genericName;
    }

    public String getStrength() {
        return strength;
    }

    public void setStrength(String strength) {
        this.strength = strength;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public double getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(double sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}
