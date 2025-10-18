package com.emranhss.hospital.dto;

import java.util.List;

public class PatientMedicineDetailsDTO {

    private String patientName;
    private int age;
    private String phone;
    private String address;
    private List<MedicineAdmitedPatientDTO> medicines;


    public String getPatientName() { return patientName; }
    public void setPatientName(String patientName) { this.patientName = patientName; }
    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public List<MedicineAdmitedPatientDTO> getMedicines() { return medicines; }
    public void setMedicines(List<MedicineAdmitedPatientDTO> medicines) { this.medicines = medicines; }
}