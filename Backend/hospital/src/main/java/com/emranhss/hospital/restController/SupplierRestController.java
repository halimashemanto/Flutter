package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.SupplierDto;
import com.emranhss.hospital.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/suppliers")
public class SupplierRestController {



    @Autowired
    private SupplierService supplierService;

    @GetMapping
    public List<SupplierDto> getAll() {
        return supplierService.getAllSuppliers();
    }

    @GetMapping("/{id}")
    public SupplierDto getById(@PathVariable Long id) {
        return supplierService.getSupplierById(id);
    }

    @PostMapping
    public SupplierDto save(@RequestBody SupplierDto dto) {
        return supplierService.saveSupplier(dto);
    }

    @PutMapping("/{id}")
    public SupplierDto update(@PathVariable Long id, @RequestBody SupplierDto dto) {
        dto.setId(id);
        return supplierService.saveSupplier(dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        supplierService.deleteSupplier(id);
    }
}
