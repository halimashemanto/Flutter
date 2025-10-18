package com.emranhss.hospital.dto;

import com.emranhss.hospital.entity.Department;
import com.emranhss.hospital.entity.Doctor;
import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

import java.util.Date;



public class DoctorDTO {

    private Long id;
    private String name;
    private String email;
    private String phone;
    private String gender;
    private String status;
    private String study;
    private String chamber;
    private Date joinDate;
    private String photo;

    // Department info
    private Long departmentId;
    private String departmentName;
    private String departmentDescription;

//    // Department info
//    private DepartmentResponseDTO departmentResponseDTO;

    public DoctorDTO() {

    }

    public DoctorDTO(Long id, String name, String email, String phone, String gender, String status, String study, String chamber, Date joinDate, String photo, Long departmentId, String departmentName, String departmentDescription) {
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
        this.departmentId = departmentId;
        this.departmentName = departmentName;
        this.departmentDescription = departmentDescription;
//        this.departmentResponseDTO = departmentResponseDTO;
    }

    // Getters and setters for all fields
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getStudy() { return study; }
    public void setStudy(String study) { this.study = study; }

    public String getChamber() { return chamber; }
    public void setChamber(String chamber) { this.chamber = chamber; }

    public Date getJoinDate() { return joinDate; }
    public void setJoinDate(Date joinDate) { this.joinDate = joinDate; }

    public String getPhoto() { return photo; }
    public void setPhoto(String photo) { this.photo = photo; }

    public Long getDepartmentId() { return departmentId; }
    public void setDepartmentId(Long departmentId) { this.departmentId = departmentId; }

    public String getDepartmentName() { return departmentName; }
    public void setDepartmentName(String departmentName) { this.departmentName = departmentName; }

    public String getDepartmentDescription() { return departmentDescription; }

//    public DepartmentResponseDTO getDepartmentResponseDTO() {
//        return departmentResponseDTO;
//    }
//
//    public void setDepartmentResponseDTO(DepartmentResponseDTO departmentResponseDTO) {
//        this.departmentResponseDTO = departmentResponseDTO;
//    }

    public void setDepartmentDescription(String departmentDescription) { this.departmentDescription = departmentDescription;



    }
}
