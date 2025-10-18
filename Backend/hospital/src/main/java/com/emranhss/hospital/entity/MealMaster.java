package com.emranhss.hospital.entity;


import jakarta.persistence.*;

@Entity
@Table(name = "mealMasters")
public class MealMaster {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String category; // Breakfast / Lunch / Dinner / Snack
    private String type;     // Set1 / Set2 / Special / Diet
    private String name;     // Meal Name
    private String details;  // Meal description / ingredients
    private Double price;    // Price


    public MealMaster() {
    }

    public MealMaster(Long id, String category, String type, String name, String details, Double price) {
        this.id = id;
        this.category = category;
        this.type = type;
        this.name = name;
        this.details = details;
        this.price = price;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetails() { return details; }
    public void setDetails(String details) { this.details = details; }

    public Double getPrice() { return price; }
    public void setPrice(Double price) { this.price = price; }


}
