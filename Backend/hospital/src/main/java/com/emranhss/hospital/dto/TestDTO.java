package com.emranhss.hospital.dto;

public class TestDTO {

    private Long id;
    private String testName;
    private Double testPrice;
    private Long invoiceId; // just store invoice id, avoid full nested invoice

    public TestDTO() {}

    public TestDTO(Long id, String testName, Double testPrice, Long invoiceId) {
        this.id = id;
        this.testName = testName;
        this.testPrice = testPrice;
        this.invoiceId = invoiceId;
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getTestName() { return testName; }
    public void setTestName(String testName) { this.testName = testName; }
    public Double getTestPrice() { return testPrice; }
    public void setTestPrice(Double testPrice) { this.testPrice = testPrice; }
    public Long getInvoiceId() { return invoiceId; }
    public void setInvoiceId(Long invoiceId) { this.invoiceId = invoiceId; }
}
