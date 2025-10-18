package com.emranhss.hospital.dto;

public class MedicineDTO {

    private Long id;
    private String medicineName;
    private String dose;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String name) {
        this.medicineName = name;
    }

    public String getDose() {
        return dose;
    }

    public void setDose(String dose) {
        this.dose = dose;
    }
}
