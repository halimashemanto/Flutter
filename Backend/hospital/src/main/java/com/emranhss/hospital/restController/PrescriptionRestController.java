package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.PrescriptionDTO;
import com.emranhss.hospital.entity.Prescription;
import com.emranhss.hospital.service.PrescriptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/prescription")
public class PrescriptionRestController {

    @Autowired
    private PrescriptionService prescriptionService;


    @PostMapping
    public ResponseEntity<PrescriptionDTO> savePrescription(@RequestBody PrescriptionDTO dto) {
        Prescription saved = prescriptionService.savePrescription(dto);
        PrescriptionDTO responseDTO = prescriptionService.mapToResponseDTO(saved);
        return ResponseEntity.ok(responseDTO);
    }



//    @PostMapping
//    public ResponseEntity<Prescription> savePrescription(@RequestBody PrescriptionDTO dto) {
//        Prescription saved = prescriptionService.savePrescription(dto);
//        return ResponseEntity.ok(saved);
//    }




    @DeleteMapping("/{id}")
    public String delete(@PathVariable Long id) throws Exception {
        prescriptionService.deletePrescription(id);
        return "Deleted successfully";
    }

//    @GetMapping
//    public List<PrescriptionDTO> getAll() {
//        return prescriptionService.getAllPrescriptionsDTO();
//    }
//
//
//    @GetMapping("/{id}")
//    public PrescriptionDTO getById(@PathVariable Long id) throws Exception {
//        return prescriptionService.getPrescriptionDTOById(id);
//    }
}