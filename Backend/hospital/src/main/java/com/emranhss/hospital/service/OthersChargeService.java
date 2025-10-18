package com.emranhss.hospital.service;


import com.emranhss.hospital.dto.OthersChargeDTO;
import com.emranhss.hospital.dto.PatientOthersChargeDTO;
import com.emranhss.hospital.entity.AdmittedPatient;
import com.emranhss.hospital.entity.BedBooking;
import com.emranhss.hospital.entity.OthersCharge;
import com.emranhss.hospital.repository.IAdmittedPatientRepo;
import com.emranhss.hospital.repository.IBedBookingRepo;
import com.emranhss.hospital.repository.IOthersChargeRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class OthersChargeService {


    @Autowired
    private IOthersChargeRepo othersChargeRepo;

    @Autowired
    private IBedBookingRepo bedBookingRepo;

    @Autowired
    private IAdmittedPatientRepo admittedPatientRepo;

    // Add single OthersCharge
    public OthersChargeDTO addCharge(OthersChargeDTO dto) {
        OthersCharge charge = new OthersCharge();
        charge.setDescription(dto.getDescription());
        charge.setAmount(dto.getAmount());

        BedBooking bedBooking = bedBookingRepo.findById(dto.getBedBookingId())
                .orElseThrow(() -> new RuntimeException("BedBooking not found"));
        charge.setBedBooking(bedBooking);


        OthersCharge saved = othersChargeRepo.save(charge);
        dto.setId(saved.getId());
        return dto;
    }

    // Get all charges for a BedBooking
    public PatientOthersChargeDTO getPatientCharges(Long bedBookingId) {
        BedBooking bedBooking = bedBookingRepo.findById(bedBookingId)
                .orElseThrow(() -> new RuntimeException("BedBooking not found"));
        AdmittedPatient patient = bedBooking.getAdmittedPatient();

        List<OthersCharge> charges = othersChargeRepo.findByBedBookingId(bedBookingId);

        double total = charges.stream().mapToDouble(OthersCharge::getAmount).sum();

        PatientOthersChargeDTO dto = new PatientOthersChargeDTO();
        dto.setBedBookingId(bedBookingId);

// Patient details directly from bedBooking
        dto.setPatientName(bedBooking.getPatientName());
        dto.setAge(bedBooking.getAge());
        dto.setPhone(bedBooking.getPhone());
        dto.setAddress(bedBooking.getAddress());

// Charges
        dto.setCharges(charges.stream().map(c -> {
            OthersChargeDTO cDto = new OthersChargeDTO();
            cDto.setId(c.getId());
            cDto.setAmount(c.getAmount());
            cDto.setDescription(c.getDescription());
            cDto.setBedBookingId(c.getBedBooking().getId());

            return cDto;
        }).collect(Collectors.toList()));

// Total calculation
        dto.setTotalAmount(total);

        return dto;

    }


    public void deleteCharge(Long chargeId){
        othersChargeRepo.deleteById(chargeId);
    }
}
