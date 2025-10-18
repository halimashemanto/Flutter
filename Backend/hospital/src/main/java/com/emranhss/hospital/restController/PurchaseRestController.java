package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.PurchaseDto;
import com.emranhss.hospital.service.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/purchases")
public class PurchaseRestController {


    @Autowired
    private PurchaseService purchaseService;

    @GetMapping
    public List<PurchaseDto> getAll() {
        return purchaseService.getAllPurchases();
    }

    @GetMapping("/{id}")
    public PurchaseDto getById(@PathVariable Long id) {
        return purchaseService.getPurchaseById(id);
    }

    @PostMapping
    public PurchaseDto save(@RequestBody PurchaseDto dto) {
        return purchaseService.savePurchase(dto);
    }

    @PutMapping("/{id}")
    public PurchaseDto update(@PathVariable Long id, @RequestBody PurchaseDto dto) {
        dto.setId(id);
        return purchaseService.savePurchase(dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        purchaseService.deletePurchase(id);
    }
}
