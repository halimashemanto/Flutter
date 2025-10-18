package com.emranhss.hospital.entity;


import jakarta.persistence.*;

import java.sql.Date;

@Entity
@Table(name = "receptionists")
public class Receptionist {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String email;
    private String address;
    private String phone;
    private String gender;
    private String status;
    private Date joinDate;
    private String photo;

    @OneToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    public Receptionist() {
    }

    public Receptionist(String name, Long id, String email, String address, String phone, String gender, String status, User user, String photo, Date joinDate) {
        this.name = name;
        this.id = id;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.gender = gender;
        this.status = status;
        this.user = user;
        this.photo = photo;
        this.joinDate = joinDate;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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
