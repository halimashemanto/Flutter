package com.emranhss.hospital.entity;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;



@Entity
@Table(name = "departments" )
public class Department {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String departmentName;
    private String description;

    @OneToMany(mappedBy = "department", cascade = CascadeType.ALL)
    private List<Doctor> doctors;

    public Department() {
    }

    public Department(long id, String departmentName, String description, List<Doctor> doctors) {
        this.id = id;
        this.departmentName = departmentName;
        this.description = description;
        this.doctors = doctors;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Doctor> getDoctors() {
        return doctors;
    }

    public void setDoctors(List<Doctor> doctors) {
        this.doctors = doctors;
    }
}
