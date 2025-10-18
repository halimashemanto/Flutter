package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.OthersChargeDTO;
import com.emranhss.hospital.dto.PatientOthersChargeDTO;
import com.emranhss.hospital.service.OthersChargeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/others-charges")
public class OthersChargeRestController {


    @Autowired
    private OthersChargeService service;

    @PostMapping
    public OthersChargeDTO addCharge(@RequestBody OthersChargeDTO dto) {
        return service.addCharge(dto);
    }

    @GetMapping("/bed/{bedBookingId}")
    public PatientOthersChargeDTO getPatientCharges(@PathVariable Long bedBookingId) {
        return service.getPatientCharges(bedBookingId);
    }

    @DeleteMapping("/{id}")
    public void deleteCharge(@PathVariable Long id) {
        service.deleteCharge(id);
    }



}
