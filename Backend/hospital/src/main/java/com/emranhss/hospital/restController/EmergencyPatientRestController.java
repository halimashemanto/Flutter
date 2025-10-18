package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.EmergencyPatientDTO;
import com.emranhss.hospital.service.EmergencyPatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/emergency")
public class EmergencyPatientRestController {

    @Autowired
    private EmergencyPatientService emergencyPatientService;

    public EmergencyPatientRestController(EmergencyPatientService emergencyPatientService) {
        this.emergencyPatientService = emergencyPatientService;
    }


    @PostMapping
    public EmergencyPatientDTO create(@RequestBody EmergencyPatientDTO dto) {
        return emergencyPatientService.createEmergencyPatient(dto);
    }


    @GetMapping
    public List<EmergencyPatientDTO> getAll() {
        return emergencyPatientService.getAllEmergencyPatients();
    }


    @GetMapping("/{id}")
    public EmergencyPatientDTO getById(@PathVariable Long id) {
        return emergencyPatientService.getEmergencyPatientById(id);
    }


    @PutMapping("/{id}")
    public EmergencyPatientDTO update(@PathVariable Long id, @RequestBody EmergencyPatientDTO dto) {
        return emergencyPatientService.updateEmergencyPatient(id, dto);
    }


    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        emergencyPatientService.deleteEmergencyPatient(id);
    }
}
