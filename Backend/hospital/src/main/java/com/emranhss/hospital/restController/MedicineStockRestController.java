package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.MedicineStockDto;
import com.emranhss.hospital.service.MedicineStockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/stocks")
public class MedicineStockRestController {


    @Autowired
    private MedicineStockService stockService;

    @GetMapping
    public List<MedicineStockDto> getAll() {
        return stockService.getAllStock();
    }

    @GetMapping("/{id}")
    public MedicineStockDto getById(@PathVariable Long id) {
        return stockService.getStockById(id);
    }

    @PostMapping
    public MedicineStockDto save(@RequestBody MedicineStockDto dto) {
        return stockService.saveStock(dto);
    }

    @PutMapping("/{id}")
    public MedicineStockDto update(@PathVariable Long id, @RequestBody MedicineStockDto dto) {
        dto.setId(id);
        return stockService.saveStock(dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        stockService.deleteStock(id);
    }
}


