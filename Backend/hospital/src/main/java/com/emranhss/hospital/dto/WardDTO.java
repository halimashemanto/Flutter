package com.emranhss.hospital.dto;

import java.util.List;

public class WardDTO {

    private Long id;
    private String wardName;
    private String wardType;   // GENERAL / CABIN / ICU
    private double pricePerDay;

    private List<BedDTO> beds;
    private List<FacilityDTO> facilities;

    public WardDTO() {}

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

    public List<BedDTO> getBeds() {
        return beds;
    }

    public void setBeds(List<BedDTO> beds) {
        this.beds = beds;
    }

    public List<FacilityDTO> getFacilities() {
        return facilities;
    }

    public void setFacilities(List<FacilityDTO> facilities) {
        this.facilities = facilities;
    }
}
