package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.DoctorChargeDTO;
import com.emranhss.hospital.dto.PatientDoctorChargeDTO;
import com.emranhss.hospital.service.DoctorChargeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/doctor-charges")
public class DoctorChargeRestController {

    @Autowired
    private DoctorChargeService service;


    @PostMapping
    public DoctorChargeDTO addCharge(@RequestBody DoctorChargeDTO dto) {
        return service.addCharge(dto);
    }

    @GetMapping("/bed/{bedBookingId}")
    public PatientDoctorChargeDTO getPatientCharges(@PathVariable Long bedBookingId) {
        return service.getPatientCharges(bedBookingId);
    }

    @DeleteMapping("/{id}")
    public void deleteCharge(@PathVariable Long id) {
        service.deleteCharge(id);
    }


}
