package com.emranhss.hospital.dto;

public class PurchaseItemDto {

    private Long id;
    private Long medicineStockId;
    private int quantity;
    private double unitPrice;
    private double subtotal;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getMedicineStockId() {
        return medicineStockId;
    }

    public void setMedicineStockId(Long medicineStockId) {
        this.medicineStockId = medicineStockId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public PurchaseItemDto() {}

}
