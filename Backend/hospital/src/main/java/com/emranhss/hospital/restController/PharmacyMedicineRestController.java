package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.PharmacyMedicineDto;
import com.emranhss.hospital.service.PharmacyMedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/medicines")
public class PharmacyMedicineRestController {



    @Autowired
    private PharmacyMedicineService medicineService;

    @GetMapping
    public List<PharmacyMedicineDto> getAll() {
        return medicineService.getAllMedicines();
    }

    @GetMapping("/{id}")
    public PharmacyMedicineDto getById(@PathVariable Long id) {
        return medicineService.getMedicineById(id);
    }

    @PostMapping
    public PharmacyMedicineDto save(@RequestBody PharmacyMedicineDto dto) {
        return medicineService.saveMedicine(dto);
    }

    @PutMapping("/{id}")
    public PharmacyMedicineDto update(@PathVariable Long id, @RequestBody PharmacyMedicineDto dto) {
        dto.setId(id);
        return medicineService.saveMedicine(dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        medicineService.deleteMedicine(id);
    }
}
