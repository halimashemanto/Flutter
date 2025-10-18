package com.emranhss.hospital.service;


import com.emranhss.hospital.Mapper.AppointmentMapper;
import com.emranhss.hospital.dto.AppoinmentDTO;
import com.emranhss.hospital.entity.Appoinment;
import com.emranhss.hospital.entity.ScheduleSlot;
import com.emranhss.hospital.repository.IAppoinmentRepo;
import com.emranhss.hospital.repository.IScheduleSlot;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class AppoinmentService {

    @Autowired
    private IAppoinmentRepo appointmentRepo;

    @Autowired
    private IScheduleSlot slotRepo;

    @Autowired
    private AppointmentMapper appointmentMapper;



    public Appoinment bookAppointment(Appoinment appointment) {

        System.out.println("Done");
        Long slotId = appointment.getScheduleSlot().getId();
        System.out.println(slotId + " 22222222222222222222");

        ScheduleSlot slot = slotRepo.findById(slotId)
                .orElseThrow(() -> new RuntimeException("Slot not found"));

        System.out.println(slot + " 111111111111111111111");

        if (slot.isBooked()) {
            throw new RuntimeException("Slot already booked!");
        }

        slot.setBooked(true);
        slotRepo.save(slot);

        appointment.setScheduleSlot(slot);

        return appointmentRepo.save(appointment);
    }



    public void cancelAppointment(Long id) {
        Appoinment appointment = appointmentRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Appointment not found"));


        ScheduleSlot slot = appointment.getScheduleSlot();
        slot.setBooked(false);
        slotRepo.save(slot);


        appointmentRepo.delete(appointment);
    }


    @Transactional
    public List<AppoinmentDTO> getAllAppointments() {
        List<Appoinment> appointments = appointmentRepo.findAll();
        return appointments.stream()
                .map(appointmentMapper::toDTO)
                .collect(Collectors.toList());
    }


    @Transactional
    public AppoinmentDTO getAppointmentById(Long id) {
        return appointmentRepo.findById(id)
                .map(appointmentMapper::toDTO)
                .orElse(null);
    }


    @Transactional
    public AppoinmentDTO getLatestAppointmentByDoctorId(Long doctorId) {
        return appointmentRepo.findTopByDoctorIdOrderByIdDesc(doctorId)
                .map(appointmentMapper::toDTO)
                .orElse(null);
    }


    public List<AppoinmentDTO> getAppointmentsByDoctorId(Long doctorId) {
        return appointmentRepo.findByDoctorId(doctorId)
                .stream()
                .map(appointmentMapper::toDTO)
                .collect(Collectors.toList());
    }


    public AppoinmentDTO getAppoinmentById(Long id) {
        Optional<Appoinment> optional = appointmentRepo.findById(id);
        if (optional.isEmpty()) return null; // or throw exception

        Appoinment appointment = optional.get();

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
