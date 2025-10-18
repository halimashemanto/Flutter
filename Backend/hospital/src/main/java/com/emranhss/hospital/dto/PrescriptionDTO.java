package com.emranhss.hospital.dto;

import java.util.Date;
import java.util.List;

public class PrescriptionDTO {


    private Long id;
    private String note;
    private String advice;
    private String height;
    private String weight;
    private String bp;
    private Date date;
    private String applyWay;

    private DoctorDTO doctor;
    private AppoinmentDTO appointment;
    private List<MedicineDTO> medicines;
    private List<TestDTO> tests;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getAdvice() {
        return advice;
    }

    public void setAdvice(String advice) {
        this.advice = advice;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getBp() {
        return bp;
    }

    public void setBp(String bp) {
        this.bp = bp;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getApplyWay() {
        return applyWay;
    }

    public void setApplyWay(String applyWay) {
        this.applyWay = applyWay;
    }

    public DoctorDTO getDoctor() {
        return doctor;
    }

    public void setDoctor(DoctorDTO doctor) {
        this.doctor = doctor;
    }

    public AppoinmentDTO getAppointment() {
        return appointment;
    }

    public void setAppointment(AppoinmentDTO appointment) {
        this.appointment = appointment;
    }

    public List<MedicineDTO> getMedicines() {
        return medicines;
    }

    public void setMedicines(List<MedicineDTO> medicines) {
        this.medicines = medicines;
    }

    public List<TestDTO> getTests() {
        return tests;
    }

    public void setTests(List<TestDTO> tests) {
        this.tests = tests;
    }
}