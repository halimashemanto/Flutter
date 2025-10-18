package com.emranhss.hospital.dto;

import java.util.Date;

public class EmergencyPatientDTO {


    private Long id;
    private Date admissionDate;
    private String conditionLevel;    // Critical / Serious / Stable
    private String broughtBy;
    private String incidentDetails;
    private String immediateTreatment;
    private boolean admittedToWard;
    private String status;


    private String patientName;
    private int patientAge;
    private String patientGender;
    private String patientContact;
    private String patientAddress;
    private String medicalHistory;
    // Getter & Setter
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Date getAdmissionDate() { return admissionDate; }
    public void setAdmissionDate(Date admissionDate) { this.admissionDate = admissionDate; }



    public String getConditionLevel() { return conditionLevel; }
    public void setConditionLevel(String conditionLevel) { this.conditionLevel = conditionLevel; }

    public String getBroughtBy() { return broughtBy; }
    public void setBroughtBy(String broughtBy) { this.broughtBy = broughtBy; }

    public String getIncidentDetails() { return incidentDetails; }
    public void setIncidentDetails(String incidentDetails) { this.incidentDetails = incidentDetails; }

    public String getImmediateTreatment() { return immediateTreatment; }
    public void setImmediateTreatment(String immediateTreatment) { this.immediateTreatment = immediateTreatment; }

    public boolean isAdmittedToWard() { return admittedToWard; }
    public void setAdmittedToWard(boolean admittedToWard) { this.admittedToWard = admittedToWard; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public int getPatientAge() {
        return patientAge;
    }

    public void setPatientAge(int patientAge) {
        this.patientAge = patientAge;
    }

    public String getPatientGender() {
        return patientGender;
    }

    public void setPatientGender(String patientGender) {
        this.patientGender = patientGender;
    }

    public String getPatientContact() {
        return patientContact;
    }

    public void setPatientContact(String patientContact) {
        this.patientContact = patientContact;
    }

    public String getPatientAddress() {
        return patientAddress;
    }

    public void setPatientAddress(String patientAddress) {
        this.patientAddress = patientAddress;
    }

    public String getMedicalHistory() {
        return medicalHistory;
    }

    public void setMedicalHistory(String medicalHistory) {
        this.medicalHistory = medicalHistory;
    }
}
