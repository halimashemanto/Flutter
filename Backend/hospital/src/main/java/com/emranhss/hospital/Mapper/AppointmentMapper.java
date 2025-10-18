package com.emranhss.hospital.Mapper;

import com.emranhss.hospital.dto.AppoinmentDTO;
import com.emranhss.hospital.entity.Appoinment;
import org.springframework.stereotype.Component;


@Component
public class AppointmentMapper {

    public AppoinmentDTO toDTO(Appoinment appointment) {
        AppoinmentDTO dto = new AppoinmentDTO();
        dto.setId(appointment.getId());
        dto.setPatientName(appointment.getPatientName());
        dto.setPatientContact(appointment.getPatientContact());
        dto.setReason(appointment.getReason());

        if (appointment.getDoctor() != null) {
            dto.setDoctorId(appointment.getDoctor().getId());
            dto.setDoctorName(appointment.getDoctor().getName());
        }

        if (appointment.getDepartment() != null) {
            dto.setDepartmentId(appointment.getDepartment().getId());
            dto.setDepartmentName(appointment.getDepartment().getDepartmentName());
        }

        if (appointment.getScheduleSlot() != null) {
            dto.setScheduleSlotId(appointment.getScheduleSlot().getId());
            dto.setSlotDate(appointment.getScheduleSlot().getDate());
            dto.setSlotStartTime(appointment.getScheduleSlot().getStartTime());
            dto.setSlotEndTime(appointment.getScheduleSlot().getEndTime());
        }

        return dto;
    }
}
