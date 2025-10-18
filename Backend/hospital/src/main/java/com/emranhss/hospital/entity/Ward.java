package com.emranhss.hospital.entity;


import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "wards")
public class Ward {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String wardName;
    private String wardType;
    private double pricePerDay;

    @OneToMany(mappedBy = "ward")
    private List<Bed> beds;

    @OneToMany(mappedBy = "ward")
    private List<Facility> facilities;

    public Ward() {}

    public Ward(Long id, String wardName, String wardType, double pricePerDay, List<Bed> beds, List<Facility> facilities) {
        this.id = id;
        this.wardName = wardName;
        this.wardType = wardType;
        this.pricePerDay = pricePerDay;
        this.beds = beds;
        this.facilities = facilities;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getWardName() {
        return wardName;
    }

    public void setWardName(String wardName) {
        this.wardName = wardName;
    }

    public String getWardType() {
        return wardType;
    }

    public void setWardType(String wardType) {
        this.wardType = wardType;
    }

    public double getPricePerDay() {
        return pricePerDay;
    }

    public void setPricePerDay(double pricePerDay) {
        this.pricePerDay = pricePerDay;
    }

    public List<Bed> getBeds() {
        return beds;
    }

    public void setBeds(List<Bed> beds) {
        this.beds = beds;
    }

    public List<Facility> getFacilities() {
        return facilities;
    }

    public void setFacilities(List<Facility> facilities) {
        this.facilities = facilities;
    }
}
