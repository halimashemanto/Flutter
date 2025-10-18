package com.emranhss.hospital.service;

import com.emranhss.hospital.dto.SupplierDto;
import com.emranhss.hospital.entity.Supplier;
import com.emranhss.hospital.repository.ISupplierRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class SupplierService {


    @Autowired
    private ISupplierRepo supplierRepository;

    public List<SupplierDto> getAllSuppliers() {
        return supplierRepository.findAll().stream().map(this::convertToDto).collect(Collectors.toList());
    }

    public SupplierDto getSupplierById(Long id) {
        return supplierRepository.findById(id).map(this::convertToDto).orElse(null);
    }
    public SupplierDto saveSupplier(SupplierDto dto) {
        Supplier sup = new Supplier();
        sup.setId(dto.getId());
        sup.setName(dto.getName());
        sup.setContactPerson(dto.getContactPerson());
        sup.setPhone(dto.getPhone());
        sup.setEmail(dto.getEmail());
        sup.setAddress(dto.getAddress());
        sup.setCreatedAt(dto.getCreatedAt());
        Supplier saved = supplierRepository.save(sup);
        return convertToDto(saved);
    }

    public void deleteSupplier(Long id) {
        supplierRepository.deleteById(id);
    }

    private SupplierDto convertToDto(Supplier sup) {
        SupplierDto dto = new SupplierDto();
        dto.setId(sup.getId());
        dto.setName(sup.getName());
        dto.setContactPerson(sup.getContactPerson());
        dto.setPhone(sup.getPhone());
        dto.setEmail(sup.getEmail());
        dto.setAddress(sup.getAddress());
        dto.setCreatedAt(sup.getCreatedAt());
        return dto;
    }

}
