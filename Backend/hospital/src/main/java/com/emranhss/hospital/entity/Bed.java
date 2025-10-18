package com.emranhss.hospital.entity;


import jakarta.persistence.*;

@Entity
@Table(name = "beds")
public class Bed {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String bedNumber;     // e.g. G101, C202
    private boolean isOccupied;
    private double pricePerDay;

    @ManyToOne
    @JoinColumn(name = "ward_id")
    private Ward ward;

    public Bed() {
    }

    public Bed(Long id, String bedNumber, boolean isOccupied, double pricePerDay, Ward ward) {
        this.id = id;
        this.bedNumber = bedNumber;
        this.isOccupied = isOccupied;
        this.pricePerDay = pricePerDay;
        this.ward = ward;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBedNumber() {
        return bedNumber;
    }

    public void setBedNumber(String bedNumber) {
        this.bedNumber = bedNumber;
    }

    public boolean isOccupied() {
        return isOccupied;
    }

    public void setOccupied(boolean occupied) {
        isOccupied = occupied;
    }

    public double getPricePerDay() {
        return pricePerDay;
    }

    public void setPricePerDay(double pricePerDay) {
        this.pricePerDay = pricePerDay;
    }

    public Ward getWard() {
        return ward;
    }

    public void setWard(Ward ward) {
        this.ward = ward;
    }
}
