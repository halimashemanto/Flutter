package com.emranhss.hospital.entity;


import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "bedBookings")
public class BedBooking {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String patientName;
    private int age;
    private String phone;
    private String address;
    private String broughtBy;
    private Date admissionDate;
    private Date dischargeDate;
    private double totalCharge;

    @ManyToOne
    @JoinColumn(name = "bed_id")
    private Bed bed;

    @ManyToOne
    @JoinColumn(name = "admitted_patient_id")
    private AdmittedPatient admittedPatient;

    public BedBooking() {}

    public BedBooking(Long id, String patientName, int age, String phone, String address, String broughtBy, Date admissionDate, Date dischargeDate, double totalCharge, Bed bed, AdmittedPatient admittedPatient) {
        this.id = id;
        this.patientName = patientName;
        this.age = age;
        this.phone = phone;
        this.address = address;
        this.broughtBy = broughtBy;
        this.admissionDate = admissionDate;
        this.dischargeDate = dischargeDate;
        this.totalCharge = totalCharge;
        this.bed = bed;
        this.admittedPatient = admittedPatient;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBroughtBy() {
        return broughtBy;
    }

    public void setBroughtBy(String broughtBy) {
        this.broughtBy = broughtBy;
    }

    public Date getAdmissionDate() {
        return admissionDate;
    }

    public void setAdmissionDate(Date admissionDate) {
        this.admissionDate = admissionDate;
    }

    public Date getDischargeDate() {
        return dischargeDate;
    }

    public void setDischargeDate(Date dischargeDate) {
        this.dischargeDate = dischargeDate;
    }

    public double getTotalCharge() {
        return totalCharge;
    }

    public void setTotalCharge(double totalCharge) {
        this.totalCharge = totalCharge;
    }

    public Bed getBed() {
        return bed;
    }

    public void setBed(Bed bed) {
        this.bed = bed;
    }

    public AdmittedPatient getAdmittedPatient() {
        return admittedPatient;
    }

    public void setAdmittedPatient(AdmittedPatient admittedPatient) {
        this.admittedPatient = admittedPatient;
    }


    @Override
    public String toString() {
        return "BedBooking{" +
                "id=" + id +
                ", patientName='" + patientName + '\'' +
                ", age=" + age +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", broughtBy='" + broughtBy + '\'' +
                ", admissionDate=" + admissionDate +
                ", dischargeDate=" + dischargeDate +
                ", totalCharge=" + totalCharge +
                ", bed=" + bed +
                ", admittedPatient=" + admittedPatient +
                '}';
    }
}
