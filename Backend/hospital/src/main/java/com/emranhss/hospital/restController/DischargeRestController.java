package com.emranhss.hospital.restController;

import com.emranhss.hospital.dto.DischargeBillDTO;
import com.emranhss.hospital.service.DischargeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("/api/discharge")
public class DischargeRestController {

    @Autowired
    private DischargeService dischargeService;


    @PostMapping
    public ResponseEntity<DischargeBillDTO> dischargePatient(
            @RequestParam Long bedBookingId,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date dischargeDate) {

        DischargeBillDTO dto = dischargeService.dischargePatient(bedBookingId, dischargeDate);
        return ResponseEntity.ok(dto);
    }

}
