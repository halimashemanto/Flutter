package com.emranhss.hospital.restController;


import com.emranhss.hospital.Mapper.InvoiceMapper;
import com.emranhss.hospital.dto.InvoiceDTO;
import com.emranhss.hospital.entity.Invoice;
import com.emranhss.hospital.service.InvoiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/invoice")
public class InvoiceRestController {

    @Autowired
    private  InvoiceService invoiceService;

    @Autowired
    private InvoiceMapper invoiceMapper;

    @Autowired
    public InvoiceRestController(InvoiceService invoiceService, InvoiceMapper invoiceMapper) {
        this.invoiceService = invoiceService;
        this.invoiceMapper = invoiceMapper;
    }


    @PostMapping
    public ResponseEntity<InvoiceDTO> createInvoice(@RequestBody InvoiceDTO dto) {
        Invoice savedInvoice = invoiceService.saveInvoice(dto);
        InvoiceDTO response = invoiceMapper.toDto(savedInvoice);
        return ResponseEntity.ok(response);
    }


    @GetMapping
    public ResponseEntity<List<InvoiceDTO>> getAllInvoices() {
        List<InvoiceDTO> invoices = invoiceService.getAllInvoices()
                .stream()
                .map(invoiceMapper::toDto)
                .collect(Collectors.toList());
        return ResponseEntity.ok(invoices);
    }


    @GetMapping("/{id}")
    public ResponseEntity<InvoiceDTO> getInvoiceById(@PathVariable Long id) {
        return invoiceService.getInvoiceById(id)
                .map(invoiceMapper::toDto)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
}
