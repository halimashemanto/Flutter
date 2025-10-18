package com.emranhss.hospital.dto;

public class ItemizedBillDTO {


    private String category;
    private String itemName;
    private double amount;

    public ItemizedBillDTO(String category, String itemName, double amount) {
        this.category = category;
        this.itemName = itemName;
        this.amount = amount;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }



}
