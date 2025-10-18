package com.emranhss.hospital.dto;



import java.util.Date;
import java.util.List;

public class InvoiceDTO {

    private Long id;

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



    private Long doctorId;
    private String doctorName;


    private String patientName;
    private String patientContact;

    private List<Long> testIds;
    private List<String> testNames;



    public Long getDoctorId() {
        return doctorId;
    }
    public void setDoctorId(Long doctorId) {
        this.doctorId = doctorId;
    }

    public List<Long> getTestIds() {
        return testIds;
    }
    public void setTestIds(List<Long> testIds) {
        this.testIds = testIds;
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

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getPatientContact() {
        return patientContact;
    }

    public void setPatientContact(String patientContact) {
        this.patientContact = patientContact;
    }

    public List<String> getTestNames() {
        return testNames;
    }

    public void setTestNames(List<String> testNames) {
        this.testNames = testNames;
    }
}
