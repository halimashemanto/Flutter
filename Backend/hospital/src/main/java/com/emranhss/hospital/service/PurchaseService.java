package com.emranhss.hospital.service;

import com.emranhss.hospital.dto.PurchaseDto;
import com.emranhss.hospital.dto.PurchaseItemDto;
import com.emranhss.hospital.entity.MedicineStock;
import com.emranhss.hospital.entity.Purchase;
import com.emranhss.hospital.entity.PurchaseItem;
import com.emranhss.hospital.entity.Supplier;
import com.emranhss.hospital.repository.IMedicineStockRepo;
import com.emranhss.hospital.repository.IPurchaseItemRepo;
import com.emranhss.hospital.repository.IPurchaseRepo;
import com.emranhss.hospital.repository.ISupplierRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class PurchaseService {


    @Autowired
    private IPurchaseRepo purchaseRepository;

    @Autowired
    private IPurchaseItemRepo itemRepository;

    @Autowired
    private ISupplierRepo supplierRepository;

    @Autowired
    private IMedicineStockRepo stockRepository;

    // List all purchases
    public List<PurchaseDto> getAllPurchases() {
        return purchaseRepository.findAll().stream().map(this::convertToDto).collect(Collectors.toList());
    }

    public PurchaseDto getPurchaseById(Long id) {
        return purchaseRepository.findById(id).map(this::convertToDto).orElse(null);
    }

//    public PurchaseDto savePurchase(PurchaseDto dto) {
//        Purchase purchase = new Purchase();
//        purchase.setId(dto.getId());
//        Supplier sup = supplierRepository.findById(dto.getSupplierId()).orElse(null);
//        purchase.setSupplier(sup);
//        purchase.setInvoiceNo(dto.getInvoiceNo());
//        purchase.setPurchaseDate(dto.getPurchaseDate());
//        purchase.setTotalAmount(dto.getTotalAmount());
//        purchase.setCreatedAt(dto.getCreatedAt());
//        // Save purchase first
//        Purchase savedPurchase = purchaseRepository.save(purchase);
//
//        // Save purchase items
//        if (dto.getItems() != null) {
//            List<PurchaseItem> items = dto.getItems().stream().map(itemDto -> {
//                PurchaseItem item = new PurchaseItem();
//                item.setPurchase(savedPurchase);
//                MedicineStock stock = stockRepository.findById(itemDto.getMedicineStockId()).orElse(null);
//                item.setMedicineStock(stock);
//                item.setQuantity(itemDto.getQuantity());
//                item.setUnitPrice(itemDto.getUnitPrice());
//                item.setSubtotal(itemDto.getSubtotal());
//                return itemRepository.save(item);
//            }).collect(Collectors.toList());
//        }
//
//        return convertToDto(savedPurchase);
//    }





    public PurchaseDto savePurchase(PurchaseDto dto) {
        // 1. Create or update Purchase entity
        Purchase purchase = new Purchase();
        purchase.setId(dto.getId());
        Supplier sup = supplierRepository.findById(dto.getSupplierId()).orElse(null);
        purchase.setSupplier(sup);
        purchase.setInvoiceNo(dto.getInvoiceNo());
        purchase.setPurchaseDate(dto.getPurchaseDate());
        purchase.setTotalAmount(dto.getTotalAmount());
        purchase.setCreatedAt(dto.getCreatedAt());

        // Save purchase first
        Purchase savedPurchase = purchaseRepository.save(purchase);

        // 2. Save purchase items and update stock
        if (dto.getItems() != null) {
            dto.getItems().forEach(itemDto -> {
                MedicineStock stock = stockRepository.findById(itemDto.getMedicineStockId()).orElse(null);
                if (stock != null) {
                    // Update stock quantity
                    stock.setQuantity(stock.getQuantity() + itemDto.getQuantity());
                    stockRepository.save(stock);
                }

                PurchaseItem item = new PurchaseItem();
                item.setPurchase(savedPurchase);
                item.setMedicineStock(stock);
                item.setQuantity(itemDto.getQuantity());
                item.setUnitPrice(itemDto.getUnitPrice());
                item.setSubtotal(itemDto.getSubtotal());
                itemRepository.save(item);
            });
        }

        // 3. Convert saved purchase to DTO and return
        return convertToDto(savedPurchase);
    }
















    public void deletePurchase(Long id) {
        purchaseRepository.deleteById(id);
    }

    private PurchaseDto convertToDto(Purchase purchase) {
        PurchaseDto dto = new PurchaseDto();
        dto.setId(purchase.getId());
        dto.setSupplierId(purchase.getSupplier() != null ? purchase.getSupplier().getId() : null);
        dto.setInvoiceNo(purchase.getInvoiceNo());
        dto.setPurchaseDate(purchase.getPurchaseDate());
        dto.setTotalAmount(purchase.getTotalAmount());
        dto.setCreatedAt(purchase.getCreatedAt());

        if (purchase.getItems() != null) {
            List<PurchaseItemDto> items = purchase.getItems().stream().map(item -> {
                PurchaseItemDto itemDto = new PurchaseItemDto();
                itemDto.setId(item.getId());
                itemDto.setMedicineStockId(item.getMedicineStock() != null ? item.getMedicineStock().getId() : null);
                itemDto.setQuantity(item.getQuantity());
                itemDto.setUnitPrice(item.getUnitPrice());
                itemDto.setSubtotal(item.getSubtotal());
                return itemDto;
            }).collect(Collectors.toList());
            dto.setItems(items);
        }

        return dto;
    }


}
