package com.emranhss.hospital.service;

import com.emranhss.hospital.dto.SaleDto;
import com.emranhss.hospital.dto.SaleItemDto;
import com.emranhss.hospital.entity.MedicineStock;
import com.emranhss.hospital.entity.Sale;
import com.emranhss.hospital.entity.SaleItem;
import com.emranhss.hospital.repository.IMedicineStockRepo;
import com.emranhss.hospital.repository.ISaleItemRepo;
import com.emranhss.hospital.repository.ISaleRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class SaleService {


    @Autowired
    private ISaleRepo saleRepository;

    @Autowired
    private ISaleItemRepo itemRepository;

    @Autowired
    private IMedicineStockRepo stockRepository;

    public List<SaleDto> getAllSales() {
        return saleRepository.findAll().stream().map(this::convertToDto).collect(Collectors.toList());
    }

    public SaleDto getSaleById(Long id) {
        return saleRepository.findById(id).map(this::convertToDto).orElse(null);
    }


    public SaleDto saveSale(SaleDto dto) {

        Sale sale = new Sale();
        sale.setId(dto.getId());
        sale.setInvoiceNo(dto.getInvoiceNo());
        sale.setPatientName(dto.getPatientName());
        sale.setSaleDate(dto.getSaleDate());
        sale.setTotalAmount(dto.getTotalAmount());
        sale.setCreatedAt(dto.getCreatedAt());


        Sale savedSale = saleRepository.save(sale);

        if (dto.getItems() != null) {
            dto.getItems().forEach(itemDto -> {
                MedicineStock stock = stockRepository.findById(itemDto.getMedicineStockId()).orElse(null);
                if (stock != null) {
                    // Check stock availability
                    if (stock.getQuantity() >= itemDto.getQuantity()) {
                        stock.setQuantity(stock.getQuantity() - itemDto.getQuantity());
                        stockRepository.save(stock);
                    } else {
                        throw new RuntimeException(
                                "Not enough stock for medicine ID: " + stock.getId() +
                                        ". Available: " + stock.getQuantity() +
                                        ", Requested: " + itemDto.getQuantity()
                        );
                    }
                }

                SaleItem item = new SaleItem();
                item.setSale(savedSale);
                item.setMedicineStock(stock);
                item.setQuantity(itemDto.getQuantity());
                item.setUnitPrice(itemDto.getUnitPrice());
                item.setSubtotal(itemDto.getSubtotal());
                itemRepository.save(item);
            });
        }

        return convertToDto(savedSale);
    }

    public void deleteSale(Long id) {
        saleRepository.deleteById(id);
    }

    private SaleDto convertToDto(Sale sale) {
        SaleDto dto = new SaleDto();
        dto.setId(sale.getId());
        dto.setInvoiceNo(sale.getInvoiceNo());
        dto.setPatientName(sale.getPatientName());
        dto.setSaleDate(sale.getSaleDate());
        dto.setTotalAmount(sale.getTotalAmount());
        dto.setCreatedAt(sale.getCreatedAt());

        if (sale.getItems() != null) {
            List<SaleItemDto> items = sale.getItems().stream().map(item -> {
                SaleItemDto itemDto = new SaleItemDto();
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
