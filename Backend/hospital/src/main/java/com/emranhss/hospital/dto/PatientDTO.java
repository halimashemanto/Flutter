package com.emranhss.hospital.dto;

import com.emranhss.hospital.entity.Patient;

import java.util.Date;

public class PatientDTO {


    private Long id;
    private Date date;
    private String name;
    private int age;
    private String gender;
    private String contact;
    private String address;
    private String medicalHistory;
    private String reason;
    private String status;
    private String doctorName;
    private String departmentName;




    public static PatientDTO toDTO(Patient patient) {
        PatientDTO dto = new PatientDTO();
        dto.setId(patient.getId());
        dto.setDate(patient.getDate());
        dto.setName(patient.getName());
        dto.setAge(patient.getAge());
        dto.setGender(patient.getGender());
        dto.setContact(patient.getContact());
        dto.setAddress(patient.getAddress());
        dto.setMedicalHistory(patient.getMedicalHistory());
        dto.setReason(patient.getReason());
        dto.setStatus(patient.getStatus());

        if (patient.getDoctor() != null) {
            dto.setDoctorName(patient.getDoctor().getName());
        }

        if (patient.getDepartment() != null) {
            dto.setDepartmentName(patient.getDepartment().getDepartmentName());
        }

        return dto;
    }



    public Long getId() {
        return id; }


    public void setId(Long id) {

        this.id = id; }

    public Date getDate() {
        return date; }

    public void setDate(Date date) { this.date = date; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getContact() { return contact; }
    public void setContact(String contact) { this.contact = contact; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getMedicalHistory() { return medicalHistory; }
    public void setMedicalHistory(String medicalHistory) { this.medicalHistory = medicalHistory; }

    public String getReason() { return reason; }
    public void setReason(String reason) { this.reason = reason; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getDoctorName() { return doctorName; }
    public void setDoctorName(String doctorName) { this.doctorName = doctorName; }

    public String getDepartmentName() { return departmentName; }
    public void setDepartmentName(String departmentName) { this.departmentName = departmentName; }
}


