package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.SaleDto;
import com.emranhss.hospital.service.SaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/sales")
public class SaleRestController {

    @Autowired
    private SaleService saleService;

    @GetMapping
    public List<SaleDto> getAll() {
        return saleService.getAllSales();
    }

    @GetMapping("/{id}")
    public SaleDto getById(@PathVariable Long id) {
        return saleService.getSaleById(id);
    }

    @PostMapping
    public SaleDto save(@RequestBody SaleDto dto) {
        return saleService.saveSale(dto);
    }

    @PutMapping("/{id}")
    public SaleDto update(@PathVariable Long id, @RequestBody SaleDto dto) {
        dto.setId(id);
        return saleService.saveSale(dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        saleService.deleteSale(id);
    }
}
