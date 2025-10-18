package com.emranhss.hospital.entity;


import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "meals")

public class Meal {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    private double mealCost;
    private Date servedAt;


    @ManyToOne
    @JoinColumn(name = "meal_master_id", nullable = false)
    private MealMaster mealMaster;


    @ManyToOne
    @JoinColumn(name = "bed_booking_id")
    private BedBooking bedBooking;


    @ManyToOne
    @JoinColumn(name = "admitted_patient_id")
    private AdmittedPatient admittedPatient;

    public Meal() {
    }


    public Meal(Long id, double mealCost, Date servedAt, MealMaster mealMaster, BedBooking bedBooking, AdmittedPatient admittedPatient) {
        this.id = id;
        this.mealCost = mealCost;
        this.servedAt = servedAt;
        this.mealMaster = mealMaster;
        this.bedBooking = bedBooking;
        this.admittedPatient = admittedPatient;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getMealCost() {
        return mealCost;
    }

    public void setMealCost(double mealCost) {
        this.mealCost = mealCost;
    }

    public Date getServedAt() {
        return servedAt;
    }

    public void setServedAt(Date servedAt) {
        this.servedAt = servedAt;
    }

    public MealMaster getMealMaster() {
        return mealMaster;
    }

    public void setMealMaster(MealMaster mealMaster) {
        this.mealMaster = mealMaster;
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


    @Override
    public String toString() {
        return "Meal{" +
                "id=" + id +
                ", mealCost=" + mealCost +
                ", servedAt=" + servedAt +
                ", mealMaster=" + mealMaster +
                ", bedBooking=" + bedBooking +
                ", admittedPatient=" + admittedPatient +
                '}';
    }
}



