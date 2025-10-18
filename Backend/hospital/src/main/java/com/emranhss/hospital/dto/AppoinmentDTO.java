package com.emranhss.hospital.dto;

import java.util.Date;

public class AppoinmentDTO {

    private Long id;
    private String patientName;
    private String patientContact;
    private String reason;

    private Long doctorId;
    private String doctorName;

    private Long departmentId;
    private String departmentName;

    private Long scheduleSlotId;
    private Date slotDate;
    private String slotStartTime;
    private String slotEndTime;

    public AppoinmentDTO() {}

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getPatientName() { return patientName; }
    public void setPatientName(String patientName) { this.patientName = patientName; }

    public String getPatientContact() { return patientContact; }
    public void setPatientContact(String patientContact) { this.patientContact = patientContact; }

    public String getReason() { return reason; }
    public void setReason(String reason) { this.reason = reason; }

    public Long getDoctorId() { return doctorId; }
    public void setDoctorId(Long doctorId) { this.doctorId = doctorId; }

    public String getDoctorName() { return doctorName; }
    public void setDoctorName(String doctorName) { this.doctorName = doctorName; }

    public Long getDepartmentId() { return departmentId; }
    public void setDepartmentId(Long departmentId) { this.departmentId = departmentId; }

    public String getDepartmentName() { return departmentName; }
    public void setDepartmentName(String departmentName) { this.departmentName = departmentName; }

    public Long getScheduleSlotId() { return scheduleSlotId; }
    public void setScheduleSlotId(Long scheduleSlotId) { this.scheduleSlotId = scheduleSlotId; }

    public Date getSlotDate() { return slotDate; }
    public void setSlotDate(Date slotDate) { this.slotDate = slotDate; }

    public String getSlotStartTime() { return slotStartTime; }
    public void setSlotStartTime(String slotStartTime) { this.slotStartTime = slotStartTime; }

    public String getSlotEndTime() { return slotEndTime; }
    public void setSlotEndTime(String slotEndTime) { this.slotEndTime = slotEndTime; }
}
