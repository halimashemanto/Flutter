package com.emranhss.hospital.entity;

import jakarta.persistence.*;



@Entity
@Table(name = "purchaseItems")
public class PurchaseItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "purchase_id")
    private Purchase purchase;

    @ManyToOne
    @JoinColumn(name = "stock_id")
    private MedicineStock medicineStock;

    private int quantity;
    private double unitPrice;
    private double subtotal;

    public PurchaseItem() {}

    public PurchaseItem(Long id, Purchase purchase, MedicineStock medicineStock, int quantity, double unitPrice, double subtotal) {
        this.id = id;
        this.purchase = purchase;
        this.medicineStock = medicineStock;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.subtotal = subtotal;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Purchase getPurchase() {
        return purchase;
    }

    public void setPurchase(Purchase purchase) {
        this.purchase = purchase;
    }

    public MedicineStock getMedicineStock() {
        return medicineStock;
    }

    public void setMedicineStock(MedicineStock medicineStock) {
        this.medicineStock = medicineStock;
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
}
