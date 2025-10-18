package com.emranhss.hospital.entity;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "prescriptions")
public class Prescription {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String note;
    private String advice;
    private String height;
    private String weight;
    private String bp;
    private Date date;
    private String applyWay; // new field

    @OneToMany(mappedBy = "prescription", cascade = CascadeType.ALL)
    @JsonIgnoreProperties("prescription")
    private List<Medicine> medicines;

    @OneToMany(mappedBy = "prescription", cascade = CascadeType.ALL)
    @JsonIgnoreProperties("prescription")
    private List<Tests> tests;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "doctor_id")
    @JsonIgnoreProperties("prescriptions")
    private Doctor doctor;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "appointment_id")
    @JsonIgnoreProperties("prescriptions")
    private Appoinment appointment;

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }
    public String getAdvice() { return advice; }
    public void setAdvice(String advice) { this.advice = advice; }
    public String getHeight() { return height; }
    public void setHeight(String height) { this.height = height; }
    public String getWeight() { return weight; }
    public void setWeight(String weight) { this.weight = weight; }
    public String getBp() { return bp; }
    public void setBp(String bp) { this.bp = bp; }
    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }
    public String getApplyWay() { return applyWay; }
    public void setApplyWay(String applyWay) { this.applyWay = applyWay; }
    public List<Medicine> getMedicines() { return medicines; }
    public void setMedicines(List<Medicine> medicines) { this.medicines = medicines; }
    public List<Tests> getTests() { return tests; }
    public void setTests(List<Tests> tests) { this.tests = tests; }
    public Doctor getDoctor() { return doctor; }
    public void setDoctor(Doctor doctor) { this.doctor = doctor; }
    public Appoinment getAppointment() { return appointment; }
    public void setAppointment(Appoinment appointment) { this.appointment = appointment; }
}
