package com.emranhss.hospital.entity;


import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "doctors")
public class Doctor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(length = 80,nullable = false)
    private String name;

    @Column(length = 80,nullable = false)
    private String email;
    private String phone;
    private String gender;
    private String status;
    private String study;
    private String chamber;
    private Date joinDate;
    private String photo;

    @OneToMany(mappedBy = "doctor")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler", "slots"})
    private List<ScheduleSlot> slots;

    @OneToMany(mappedBy = "doctor", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Report> reports;

    @ManyToOne(fetch = FetchType.LAZY) // Lazy load to avoid big joins unless needed
    @JoinColumn(name = "department_id") // FK column
    @JsonBackReference
    private Department department;

//
//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "department_id")
//    @JsonBackReference
//    private Department department;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;




    public Doctor() {
    }

    public Doctor(long id, String name, String email, String phone, String gender, String status, String study, String chamber, Date joinDate, String photo, List<ScheduleSlot> slots, List<Report> reports, Department department, User user) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.status = status;
        this.study = study;
        this.chamber = chamber;
        this.joinDate = joinDate;
        this.photo = photo;
        this.slots = slots;
        this.reports = reports;
        this.department = department;
        this.user = user;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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

    public String getChamber() {
        return chamber;
    }

    public void setChamber(String chamber) {
        this.chamber = chamber;
    }


    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getStudy() {
        return study;
    }

    public void setStudy(String study) {
        this.study = study;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

    public List<ScheduleSlot> getSlots() {
        return slots;
    }

    public void setSlots(List<ScheduleSlot> slots) {
        this.slots = slots;
    }

    public List<Report> getReports() {
        return reports;
    }

    public void setReports(List<Report> reports) {
        this.reports = reports;
    }
}
