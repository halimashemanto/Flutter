package com.emranhss.hospital.dto;

import java.util.Date;

public class SlotResponseDTO {


        private Long id;
        private Date date;
        private String startTime;
        private String endTime;
        private boolean booked;
        private String doctorName;
        private String departmentName;

        public SlotResponseDTO() {}

        public SlotResponseDTO(Long id, Date date, String startTime, String endTime,
                               boolean booked, String doctorName, String departmentName) {
            this.id = id;
            this.date = date;
            this.startTime = startTime;
            this.endTime = endTime;
            this.booked = booked;
            this.doctorName = doctorName;
            this.departmentName = departmentName;
        }

        // Getters & Setters
        public Long getId() { return id; }
        public void setId(Long id) { this.id = id; }

        public Date getDate() { return date; }
        public void setDate(Date date) { this.date = date; }

        public String getStartTime() { return startTime; }
        public void setStartTime(String startTime) { this.startTime = startTime; }

        public String getEndTime() { return endTime; }
        public void setEndTime(String endTime) { this.endTime = endTime; }

        public boolean isBooked() { return booked; }
        public void setBooked(boolean booked) { this.booked = booked; }

        public String getDoctorName() { return doctorName; }
        public void setDoctorName(String doctorName) { this.doctorName = doctorName; }

        public String getDepartmentName() { return departmentName; }
        public void setDepartmentName(String departmentName) { this.departmentName = departmentName; }
    }


