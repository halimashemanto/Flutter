package com.emranhss.hospital.service;


import com.emranhss.hospital.dto.DoctorChargeDTO;
import com.emranhss.hospital.dto.PatientDoctorChargeDTO;
import com.emranhss.hospital.entity.BedBooking;
import com.emranhss.hospital.entity.Doctor;
import com.emranhss.hospital.entity.DoctorCharge;
import com.emranhss.hospital.repository.IBedBookingRepo;
import com.emranhss.hospital.repository.IDoctorChargeRepo;
import com.emranhss.hospital.repository.IDoctorRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class DoctorChargeService {

    @Autowired
    private IDoctorChargeRepo repo;

    @Autowired
    private IDoctorRepo doctorRepo;

    @Autowired
    private IBedBookingRepo bedBookingRepo;


    // Add single DoctorCharge
    public DoctorChargeDTO addCharge(DoctorChargeDTO dto) {
        DoctorCharge charge = new DoctorCharge();
        charge.setDescription(dto.getDescription());
        charge.setAmount(dto.getAmount());

        BedBooking bedBooking = bedBookingRepo.findById(dto.getBedBookingId())
                .orElseThrow(() -> new RuntimeException("BedBooking not found"));
        charge.setBedBooking(bedBooking);

        Doctor doctor = doctorRepo.findById(dto.getDoctorId())
                .orElseThrow(() -> new RuntimeException("Doctor not found"));
        charge.setDoctor(doctor);

        // Visit Date
        charge.setVisitDate(dto.getVisitDate());

        DoctorCharge saved = repo.save(charge);
        dto.setId(saved.getId());
        return dto;
    }


    // Get all charges for a BedBooking
    public PatientDoctorChargeDTO getPatientCharges(Long bedBookingId) {
        BedBooking bedBooking = bedBookingRepo.findById(bedBookingId)
                .orElseThrow(() -> new RuntimeException("BedBooking not found"));

        List<DoctorCharge> charges = repo.findByBedBookingId(bedBookingId);
        double total = charges.stream().mapToDouble(DoctorCharge::getAmount).sum();

        PatientDoctorChargeDTO dto = new PatientDoctorChargeDTO();
        dto.setBedBookingId(bedBookingId);
        dto.setPatientName(bedBooking.getPatientName());
        dto.setAge(bedBooking.getAge());
        dto.setPhone(bedBooking.getPhone());
        dto.setAddress(bedBooking.getAddress());

        dto.setCharges(charges.stream().map(c -> {
            DoctorChargeDTO cDto = new DoctorChargeDTO();
            cDto.setId(c.getId());
            cDto.setDescription(c.getDescription());
            cDto.setAmount(c.getAmount());
            cDto.setBedBookingId(c.getBedBooking().getId());
            cDto.setDoctorId(c.getDoctor().getId());
            cDto.setVisitDate(c.getVisitDate());
            return cDto;
        }).collect(Collectors.toList()));

        dto.setTotalAmount(total);
        return dto;
    }

    public void deleteCharge(Long id) {
        repo.deleteById(id);
    }
}
