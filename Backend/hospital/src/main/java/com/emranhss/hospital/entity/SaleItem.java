package com.emranhss.hospital.entity;

import jakarta.persistence.*;




@Entity
@Table(name = "saleItems")
public class SaleItem {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "sale_id")
    private Sale sale;

    @ManyToOne
    @JoinColumn(name = "stock_id")
    private MedicineStock medicineStock;

    private int quantity;
    private double unitPrice;
    private double subtotal;

    public SaleItem() {}

    public SaleItem(Long id, Sale sale, MedicineStock medicineStock, int quantity, double unitPrice, double subtotal) {
        this.id = id;
        this.sale = sale;
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

    public Sale getSale() {
        return sale;
    }

    public void setSale(Sale sale) {
        this.sale = sale;
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
