package com.emranhss.hospital.entity;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "appoinments")
public class Appoinment {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String reason;

    private String patientName;
    private String patientContact;


    @ManyToOne()
    @JoinColumn(name = "department_id")
//    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private Department department;

    @ManyToOne()
    @JoinColumn(name = "doctor_id", nullable = false)
    private Doctor doctor;


    @ManyToOne()
    @JoinColumn(name = "slot_id")
    private ScheduleSlot scheduleSlot;


    @OneToMany(mappedBy = "appointment", cascade = CascadeType.ALL)
    @JsonIgnoreProperties("appointment")
    private List<Prescription> prescriptions;



    public Appoinment() {
    }

    public Appoinment(Long id, String reason, String patientName, String patientContact, Department department, Doctor doctor, ScheduleSlot scheduleSlot) {
        this.id = id;
        this.reason = reason;
        this.patientName = patientName;
        this.patientContact = patientContact;
        this.department = department;
        this.doctor = doctor;
        this.scheduleSlot = scheduleSlot;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getPatientContact() {
        return patientContact;
    }

    public void setPatientContact(String patientContact) {
        this.patientContact = patientContact;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public ScheduleSlot getScheduleSlot() {
        return scheduleSlot;
    }

    public void setScheduleSlot(ScheduleSlot scheduleSlot) {
        this.scheduleSlot = scheduleSlot;
    }

    public List<Prescription> getPrescriptions() {
        return prescriptions;
    }

    public void setPrescriptions(List<Prescription> prescriptions) {
        this.prescriptions = prescriptions;
    }
}