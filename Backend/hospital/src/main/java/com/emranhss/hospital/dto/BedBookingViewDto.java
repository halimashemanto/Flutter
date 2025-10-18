package com.emranhss.hospital.dto;

import java.util.Date;

public class BedBookingViewDto {

    //    private Long id;
    private String patientName;
    private int age;
    private String address;
    private String phone;
    private Date admissionDate;
    private Date dischargeDate;
    private  Long bedBookingId;
    private Long bedId;
    private String bedNumber;

    public BedBookingViewDto(String patientName, int age, String address, String phone, Date admissionDate, Date dischargeDate,  Long bedId, String bedNumber, Long bedBookingId) {
        this.patientName = patientName;
        this.age = age;
        this.address = address;
        this.phone = phone;
        this.admissionDate = admissionDate;
        this.dischargeDate = dischargeDate;
        this.bedBookingId = bedBookingId;
        this.bedId = bedId;
        this.bedNumber = bedNumber;
    }




    public Long getBedBookingId() {
        return bedBookingId;
    }

    public void setBedBookingId(Long bedBookingId) {
        this.bedBookingId = bedBookingId;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getAdmissionDate() {
        return admissionDate;
    }

    public void setAdmissionDate(Date admissionDate) {
        this.admissionDate = admissionDate;
    }

    public Date getDischargeDate() {
        return dischargeDate;
    }

    public void setDischargeDate(Date dischargeDate) {
        this.dischargeDate = dischargeDate;
    }

    public Long getBedId() {
        return bedId;
    }

    public void setBedId(Long bedId) {
        this.bedId = bedId;
    }

    public String getBedNumber() {
        return bedNumber;
    }

    public void setBedNumber(String bedNumber) {
        this.bedNumber = bedNumber;
    }
//
//    @Override
//    public String toString() {
//        return "BedBookingViewDto{" +
//                "id=" + id +
//                ", patientName='" + patientName + '\'' +
//                ", age=" + age +
//                ", address='" + address + '\'' +
//                ", phone='" + phone + '\'' +
//                ", admissionDate=" + admissionDate +
//                ", dischargeDate=" + dischargeDate +
//                ", bedId=" + bedId +
//                ", bedNumber='" + bedNumber + '\'' +
//                '}';
//    }
}
