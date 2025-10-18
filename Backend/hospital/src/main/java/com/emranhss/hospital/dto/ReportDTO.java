package com.emranhss.hospital.dto;

import java.util.Date;

public class ReportDTO {


    private Long id;
    private String reportResult;
    private String description;
    private String sampleId;
    private String interpretation;
    private String patientName;
    private String patientContact;
    private String preparedBy;
    private String gender;
    private Date testDate;
    private Date createDate;
    private Date deliveryDate;


    private Long doctorId;
    private String doctorName;

    public ReportDTO() {
    }

    public ReportDTO(Long id, String reportResult, String description, String sampleId, String interpretation, String patientName, String patientContact, String preparedBy, String gender, Date testDate, Date createDate, Date deliveryDate, Long doctorId, String doctorName) {
        this.id = id;
        this.reportResult = reportResult;
        this.description = description;
        this.sampleId = sampleId;
        this.interpretation = interpretation;
        this.patientName = patientName;
        this.patientContact = patientContact;
        this.preparedBy = preparedBy;
        this.gender = gender;
        this.testDate = testDate;
        this.createDate = createDate;
        this.deliveryDate = deliveryDate;
        this.doctorId = doctorId;
        this.doctorName = doctorName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getReportResult() {
        return reportResult;
    }

    public void setReportResult(String reportResult) {
        this.reportResult = reportResult;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSampleId() {
        return sampleId;
    }

    public void setSampleId(String sampleId) {
        this.sampleId = sampleId;
    }

    public String getInterpretation() {
        return interpretation;
    }

    public void setInterpretation(String interpretation) {
        this.interpretation = interpretation;
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

    public String getPreparedBy() {
        return preparedBy;
    }

    public void setPreparedBy(String preparedBy) {
        this.preparedBy = preparedBy;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getTestDate() {
        return testDate;
    }

    public void setTestDate(Date testDate) {
        this.testDate = testDate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public Long getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(Long doctorId) {
        this.doctorId = doctorId;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }
}
