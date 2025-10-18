package com.emranhss.hospital.dto;

import java.util.Date;

public class NurseDTO {

    private long id;
    private String name;
    private String email;
    private String phone;
    private String address;
    private String nurseType;
    private String gender;
    private String shift;
    private String workingHours;
    private String photo;
    private Date joinDate;


    public NurseDTO() {}

    public NurseDTO(long id, String name, String email, String phone, String address, String nurseType, String gender, String shift, String workingHours, String photo, Date joinDate) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.nurseType = nurseType;
        this.gender = gender;
        this.shift = shift;
        this.workingHours = workingHours;
        this.photo = photo;
        this.joinDate = joinDate;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNurseType() {
        return nurseType;
    }

    public void setNurseType(String nurseType) {
        this.nurseType = nurseType;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getShift() {
        return shift;
    }

    public void setShift(String shift) {
        this.shift = shift;
    }

    public String getWorkingHours() {
        return workingHours;
    }

    public void setWorkingHours(String workingHours) {
        this.workingHours = workingHours;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }
}
