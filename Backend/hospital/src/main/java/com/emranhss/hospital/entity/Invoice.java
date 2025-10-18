package com.emranhss.hospital.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

import java.util.Date;
import java.util.List;

@Entity
public class Invoice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String patientName;
    private String patientContact;
    private Double amount;
    private Double discount;
    private Date invoiceDate;
    private Date deliveryDate;
    private Integer deliveryTime;
    private Double totalAmount;
    private Double totalDiscount;
    private Double payable;
    private Double received;
    private Double due;
    private Boolean status;
    private String preparedBy;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "doctor_id", nullable = false)
    @JsonIgnore
    private Doctor doctor;



    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "invoice_id")
    private List<Tests> tests;




    public void calculateTotal() {

        // 1️⃣ Calculate total amount from tests
        this.amount = (tests != null) ? tests.stream()
                .mapToDouble(t -> t.getTestPrice() != null ? t.getTestPrice() : 0.0)
                .sum() : 0.0;

        // 2️⃣ Calculate discount as percentage
        if (this.discount != null && this.discount > 0) {
            this.totalDiscount = this.amount * (this.discount / 100.0);
        } else {
            this.totalDiscount = 0.0;
        }

        // 3️⃣ Total after discount
        this.totalAmount = this.amount - this.totalDiscount;

        // 4️⃣ Payable amount
        this.payable = this.totalAmount;

        // 5️⃣ Due calculation
        double receivedAmount = (this.received != null) ? this.received : 0.0;
        this.due = this.payable - receivedAmount;

        // 6️⃣ Status update
        this.status = this.due <= 0;
    }


    public Invoice() {
    }

    public Invoice(Long id, String patientName, String patientContact, Double amount, Double discount, Date invoiceDate, Date deliveryDate, Integer deliveryTime, Double totalAmount, Double totalDiscount, Double payable, Double received, Double due, Boolean status, String preparedBy, Doctor doctor, List<Tests> tests) {
        this.id = id;
        this.patientName = patientName;
        this.patientContact = patientContact;
        this.amount = amount;
        this.discount = discount;
        this.invoiceDate = invoiceDate;
        this.deliveryDate = deliveryDate;
        this.deliveryTime = deliveryTime;
        this.totalAmount = totalAmount;
        this.totalDiscount = totalDiscount;
        this.payable = payable;
        this.received = received;
        this.due = due;
        this.status = status;
        this.preparedBy = preparedBy;
        this.doctor = doctor;
        this.tests = tests;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public Date getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(Date invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public Integer getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(Integer deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Double getTotalDiscount() {
        return totalDiscount;
    }

    public void setTotalDiscount(Double totalDiscount) {
        this.totalDiscount = totalDiscount;
    }

    public Double getPayable() {
        return payable;
    }

    public void setPayable(Double payable) {
        this.payable = payable;
    }

    public Double getReceived() {
        return received;
    }

    public void setReceived(Double received) {
        this.received = received;
    }

    public Double getDue() {
        return due;
    }

    public void setDue(Double due) {
        this.due = due;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getPreparedBy() {
        return preparedBy;
    }

    public void setPreparedBy(String preparedBy) {
        this.preparedBy = preparedBy;
    }

    public String getPatientContact() {
        return patientContact;
    }

    public void setPatientContact(String patientContact) {
        this.patientContact = patientContact;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctorId) {
        this.doctor= doctorId;
    }

    public List<Tests> getTests() {
        return tests;
    }

    public void setTests(List<Tests> tests) {
        this.tests = tests;
    }
}
