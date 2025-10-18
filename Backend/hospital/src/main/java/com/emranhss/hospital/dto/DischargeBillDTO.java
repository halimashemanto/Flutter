package com.emranhss.hospital.dto;

import java.util.Date;
import java.util.List;

public class DischargeBillDTO {




    private String patientName;
    private int age;
    private String phone;
    private String address;
    private Date admissionDate;
    private Date dischargeDate;

    private List<ItemizedBillDTO> billItems;
    private double totalAmount;

    public DischargeBillDTO() {}

    public DischargeBillDTO(String patientName, int age, String phone, String address,
                            Date admissionDate, Date dischargeDate,
                            List<ItemizedBillDTO> billItems, double totalAmount) {
        this.patientName = patientName;
        this.age = age;
        this.phone = phone;
        this.address = address;
        this.admissionDate = admissionDate;
        this.dischargeDate = dischargeDate;
        this.billItems = billItems;
        this.totalAmount = totalAmount;
    }

    // Getters & Setters

    public String getPatientName() { return patientName; }
    public void setPatientName(String patientName) { this.patientName = patientName; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public Date getAdmissionDate() { return admissionDate; }
    public void setAdmissionDate(Date admissionDate) { this.admissionDate = admissionDate; }

    public Date getDischargeDate() { return dischargeDate; }
    public void setDischargeDate(Date dischargeDate) { this.dischargeDate = dischargeDate; }

    public List<ItemizedBillDTO> getBillItems() { return billItems; }
    public void setBillItems(List<ItemizedBillDTO> billItems) { this.billItems = billItems; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }
}
