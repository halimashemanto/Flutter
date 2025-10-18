package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.TestAdmitedPatientDTO;
import com.emranhss.hospital.service.TestAdmitedPatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/patient-tests")
public class TestAdmitedPatientRestController {

    @Autowired
    private TestAdmitedPatientService testService;

    @PostMapping("/assign")
    public TestAdmitedPatientDTO assignTests(@RequestBody TestAdmitedPatientDTO dto) {
        return testService.saveTestsForPatient(dto);
    }

    @GetMapping("/by-bed/{bedBookingId}")
    public TestAdmitedPatientDTO getTestsByBed(@PathVariable Long bedBookingId) {
        return testService.getTestsByBedBooking(bedBookingId);
    }

}