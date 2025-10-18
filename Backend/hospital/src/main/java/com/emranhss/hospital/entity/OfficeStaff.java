package com.emranhss.hospital.entity;

import jakarta.persistence.*;

import java.sql.Date;

@Entity
@Table(name = "officestaffs")
public class OfficeStaff {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 80,nullable = false)
    private String name;
    private String email;
    private String phone;
    private String gender;
    private String position;
    private String age;
    private String department;
    private String workingHours;
    private Date joinDate;
    private String photo;

    @OneToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    public OfficeStaff() {
    }

    public OfficeStaff(Long id, String gender, String name, String email, String phone, String position, String age, String department, String workingHours, Date joinDate, String photo, User user) {
        this.id = id;
        this.gender = gender;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.position = position;
        this.age = age;
        this.department = department;
        this.workingHours = workingHours;
        this.joinDate = joinDate;
        this.photo = photo;
        this.user = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getWorkingHours() {
        return workingHours;
    }

    public void setWorkingHours(String workingHours) {
        this.workingHours = workingHours;
    }

    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
