package com.emranhss.hospital.Mapper;

import com.emranhss.hospital.dto.InvoiceDTO;
import com.emranhss.hospital.entity.Invoice;
import org.springframework.stereotype.Component;

import java.util.stream.Collectors;

@Component
public class InvoiceMapper {

    public InvoiceDTO toDto(Invoice invoice) {
        InvoiceDTO dto = new InvoiceDTO();
        dto.setId(invoice.getId());
        dto.setAmount(invoice.getAmount());
        dto.setDiscount(invoice.getDiscount());
        dto.setInvoiceDate(invoice.getInvoiceDate());
        dto.setDeliveryDate(invoice.getDeliveryDate());
        dto.setDeliveryTime(invoice.getDeliveryTime());
        dto.setTotalAmount(invoice.getTotalAmount());
        dto.setTotalDiscount(invoice.getTotalDiscount());
        dto.setPayable(invoice.getPayable());
        dto.setReceived(invoice.getReceived());
        dto.setDue(invoice.getDue());
        dto.setStatus(invoice.getStatus());
        dto.setPreparedBy(invoice.getPreparedBy());

        dto.setPatientName(invoice.getPatientName());
        dto.setPatientContact(invoice.getPatientContact());


        if (invoice.getDoctor() != null) {
            dto.setDoctorId(invoice.getDoctor().getId());
            dto.setDoctorName(invoice.getDoctor().getName());
        }



        if (invoice.getTests() != null) {
            dto.setTestIds(invoice.getTests().stream()
                    .map(t -> t.getId())
                    .collect(Collectors.toList()));
            dto.setTestNames(invoice.getTests().stream()
                    .map(t -> t.getTestName())
                    .collect(Collectors.toList()));
        }

        return dto;
    }
}
