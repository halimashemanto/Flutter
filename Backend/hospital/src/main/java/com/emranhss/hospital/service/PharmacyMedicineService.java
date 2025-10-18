package com.emranhss.hospital.service;

import com.emranhss.hospital.dto.PharmacyMedicineDto;
import com.emranhss.hospital.entity.PharmacyMedicine;
import com.emranhss.hospital.repository.IPharmacyMedicineRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class PharmacyMedicineService {


    @Autowired
    private IPharmacyMedicineRepo pharmacyMedicineRepo;



    public List<PharmacyMedicineDto> getAllMedicines() {
        return pharmacyMedicineRepo.findAll().stream().map(this::convertToDto).collect(Collectors.toList());
    }


    public PharmacyMedicineDto getMedicineById(Long id) {
        return pharmacyMedicineRepo.findById(id).map(this::convertToDto).orElse(null);
    }


    public PharmacyMedicineDto saveMedicine(PharmacyMedicineDto dto) {
        PharmacyMedicine med = new PharmacyMedicine();
        med.setId(dto.getId());
        med.setName(dto.getName());
        med.setGenericName(dto.getGenericName());
        med.setStrength(dto.getStrength());
        med.setUnit(dto.getUnit());
        med.setSku(dto.getSku());
        med.setSellingPrice(dto.getSellingPrice());
        med.setCreatedAt(dto.getCreatedAt());
        PharmacyMedicine saved = pharmacyMedicineRepo.save(med);
        return convertToDto(saved);
    }


    public void deleteMedicine(Long id) {
        pharmacyMedicineRepo.deleteById(id);
    }


    private PharmacyMedicineDto convertToDto(PharmacyMedicine med) {
        PharmacyMedicineDto dto = new PharmacyMedicineDto();
        dto.setId(med.getId());
        dto.setName(med.getName());
        dto.setGenericName(med.getGenericName());
        dto.setStrength(med.getStrength());
        dto.setUnit(med.getUnit());
        dto.setSku(med.getSku());
        dto.setSellingPrice(med.getSellingPrice());
        dto.setCreatedAt(med.getCreatedAt());
        return dto;
    }
}
