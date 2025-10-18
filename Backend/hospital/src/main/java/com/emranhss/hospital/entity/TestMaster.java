package com.emranhss.hospital.entity;


import jakarta.persistence.*;

@Entity
@Table(name = "testMasters")
public class TestMaster {



    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String testName;
    private double testPrice;

    public TestMaster() {}

    public TestMaster(String testName, double testPrice) {
        this.testName = testName;
        this.testPrice = testPrice;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTestName() {
        return testName;
    }

    public void setTestName(String testName) {
        this.testName = testName;
    }

    public double getTestPrice() {
        return testPrice;
    }

    public void setTestPrice(double testPrice) {
        this.testPrice = testPrice;
    }
}
