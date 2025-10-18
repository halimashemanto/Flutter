package com.emranhss.hospital.service;


import com.emranhss.hospital.dto.MedicineStockDto;
import com.emranhss.hospital.entity.MedicineStock;
import com.emranhss.hospital.entity.PharmacyMedicine;
import com.emranhss.hospital.repository.IMedicineStockRepo;
import com.emranhss.hospital.repository.IPharmacyMedicineRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class MedicineStockService {

    @Autowired
    private IMedicineStockRepo stockRepository;

    @Autowired
    private IPharmacyMedicineRepo medicineRepository;



    public List<MedicineStockDto> getAllStock() {
        return stockRepository.findAll().stream().map(this::convertToDto).collect(Collectors.toList());
    }



    public MedicineStockDto getStockById(Long id) {
        return stockRepository.findById(id).map(this::convertToDto).orElse(null);
    }



    public MedicineStockDto saveStock(MedicineStockDto dto) {
        MedicineStock stock = new MedicineStock();
        stock.setId(dto.getId());
        PharmacyMedicine med = medicineRepository.findById(dto.getMedicineId()).orElse(null);
        stock.setMedicine(med);
        stock.setBatchNo(dto.getBatchNo());
        stock.setExpiryDate(dto.getExpiryDate());
        stock.setQuantity(dto.getQuantity());
        stock.setPurchasePrice(dto.getPurchasePrice());
        stock.setCreatedAt(dto.getCreatedAt());
        MedicineStock saved = stockRepository.save(stock);
        return convertToDto(saved);
    }



    public void deleteStock(Long id) {
        stockRepository.deleteById(id);
    }


    private MedicineStockDto convertToDto(MedicineStock stock) {
        MedicineStockDto dto = new MedicineStockDto();
        dto.setId(stock.getId());
        dto.setMedicineId(stock.getMedicine() != null ? stock.getMedicine().getId() : null);
        dto.setBatchNo(stock.getBatchNo());
        dto.setExpiryDate(stock.getExpiryDate());
        dto.setQuantity(stock.getQuantity());
        dto.setPurchasePrice(stock.getPurchasePrice());
        dto.setCreatedAt(stock.getCreatedAt());
        return dto;
    }
}
