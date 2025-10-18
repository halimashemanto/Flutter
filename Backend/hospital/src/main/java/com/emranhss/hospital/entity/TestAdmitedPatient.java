package com.emranhss.hospital.entity;


import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "testAdmitedPatient")
public class TestAdmitedPatient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private double testCost;

    @ManyToOne
    @JoinColumn(name = "bed_booking_id")
    private BedBooking bedBooking;

    @ManyToOne
    @JoinColumn(name = "admitted_patient_id")
    private AdmittedPatient admittedPatient;


    @ManyToMany
    @JoinTable(
            name = "patient_selected_tests",
            joinColumns = @JoinColumn(name = "patient_test_id"),
            inverseJoinColumns = @JoinColumn(name = "test_master_id")
    )
    private List<TestMaster> selectedTests;

    public TestAdmitedPatient() {
    }

    public TestAdmitedPatient(Long id, double testCost, BedBooking bedBooking, List<TestMaster> selectedTests) {
        this.id = id;
        this.testCost = testCost;
        this.bedBooking = bedBooking;

        this.selectedTests = selectedTests;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getTestCost() {
        return testCost;
    }

    public void setTestCost(double testCost) {
        this.testCost = testCost;
    }

    public BedBooking getBedBooking() {
        return bedBooking;
    }

    public void setBedBooking(BedBooking bedBooking) {
        this.bedBooking = bedBooking;
    }

    public AdmittedPatient getAdmittedPatient() {
        return admittedPatient;
    }

    public void setAdmittedPatient(AdmittedPatient admittedPatient) {
        this.admittedPatient = admittedPatient;
    }

    public List<TestMaster> getSelectedTests() {
        return selectedTests;
    }

    public void setSelectedTests(List<TestMaster> selectedTests) {
        this.selectedTests = selectedTests;
    }
}
