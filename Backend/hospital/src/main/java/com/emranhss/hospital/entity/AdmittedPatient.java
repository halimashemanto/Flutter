package com.emranhss.hospital.entity;


import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "admittedPatients")
public class AdmittedPatient {

         @Id
         @GeneratedValue(strategy = GenerationType.IDENTITY)
         private Long id;

        private Date admissionDate;
        private Date dischargeDate;
        private String status;
        private String treatmentPlan;


        @ManyToOne
        @JoinColumn(name = "bedBooking_id")
        private BedBooking bedBooking;

        @ManyToOne
        @JoinColumn(name = "doctor_id")
        private Doctor doctor;

        @ManyToOne
        @JoinColumn(name = "department_id")
        private Department department;


        @OneToOne(cascade = CascadeType.ALL)
        @JoinColumn(name = "bill_id")
        private Billing bill;


         @ManyToOne
         @JoinColumn(name = "ward_id")
         private Ward ward;

         @ManyToOne
         @JoinColumn(name = "bed_id")
         private Bed bed;

        @OneToMany(mappedBy = "admittedPatient", cascade = CascadeType.ALL, orphanRemoval = true)
        private List<Meal> meals = new ArrayList<>();

        @OneToMany(mappedBy = "admittedPatient", cascade = CascadeType.ALL, orphanRemoval = true)
        private List<MedicineAdmitedPatient> medicines = new ArrayList<>();

        @OneToMany(mappedBy = "admittedPatient", cascade = CascadeType.ALL, orphanRemoval = true)
        private List<TestAdmitedPatient> tests = new ArrayList<>();

        @OneToMany(mappedBy = "admittedPatient", cascade = CascadeType.ALL, orphanRemoval = true)
        private List<DoctorCharge> doctorCharges = new ArrayList<>();

        @OneToMany(mappedBy = "admittedPatient", cascade = CascadeType.ALL, orphanRemoval = true)
        private List<OthersCharge> otherCharges = new ArrayList<>();


    public AdmittedPatient() {
    }


    public AdmittedPatient(Long id, Date admissionDate, Date dischargeDate, String status, String treatmentPlan, BedBooking bedBooking ,Doctor doctor, Department department, Billing bill, Ward ward, Bed bed, List<Meal> meals, List<MedicineAdmitedPatient> medicines, List<TestAdmitedPatient> tests, List<DoctorCharge> doctorCharges, List<OthersCharge> otherCharges) {
        this.id = id;
        this.admissionDate = admissionDate;
        this.dischargeDate = dischargeDate;
        this.bedBooking = bedBooking;
        this.status = status;
        this.treatmentPlan = treatmentPlan;
        this.doctor = doctor;
        this.department = department;
        this.bill = bill;
        this.ward = ward;
        this.bed = bed;
        this.meals = meals;
        this.medicines = medicines;
        this.tests = tests;
        this.doctorCharges = doctorCharges;
        this.otherCharges = otherCharges;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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



    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTreatmentPlan() {
        return treatmentPlan;
    }

    public void setTreatmentPlan(String treatmentPlan) {
        this.treatmentPlan = treatmentPlan;
    }



    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Billing getBill() {
        return bill;
    }

    public void setBill(Billing bill) {
        this.bill = bill;
    }

    public Ward getWard() {
        return ward;
    }

    public void setWard(Ward ward) {
        this.ward = ward;
    }

    public Bed getBed() {
        return bed;
    }

    public void setBed(Bed bed) {
        this.bed = bed;
    }

    public List<Meal> getMeals() {
        return meals;
    }

    public void setMeals(List<Meal> meals) {
        this.meals = meals;
    }

    public List<MedicineAdmitedPatient> getMedicines() {
        return medicines;
    }

    public void setMedicines(List<MedicineAdmitedPatient> medicines) {
        this.medicines = medicines;
    }

    public List<TestAdmitedPatient> getTests() {
        return tests;
    }

    public void setTests(List<TestAdmitedPatient> tests) {
        this.tests = tests;
    }

    public List<DoctorCharge> getDoctorCharges() {
        return doctorCharges;
    }

    public void setDoctorCharges(List<DoctorCharge> doctorCharges) {
        this.doctorCharges = doctorCharges;
    }

    public List<OthersCharge> getOtherCharges() {
        return otherCharges;
    }

    public void setOtherCharges(List<OthersCharge> otherCharges) {
        this.otherCharges = otherCharges;
    }

    public BedBooking getBedBooking() {
        return bedBooking;
    }

    public void setBedBooking(BedBooking bedBooking) {
        this.bedBooking = bedBooking;
    }
}
