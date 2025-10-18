package com.emranhss.hospital.service;

import com.emranhss.hospital.dto.InvoiceDTO;
import com.emranhss.hospital.entity.Appoinment;
import com.emranhss.hospital.entity.Doctor;
import com.emranhss.hospital.entity.Invoice;
import com.emranhss.hospital.entity.Tests;
import com.emranhss.hospital.repository.IAppoinmentRepo;
import com.emranhss.hospital.repository.IDoctorRepo;
import com.emranhss.hospital.repository.IInvoiceRepo;
import com.emranhss.hospital.repository.ITestRepo;
import jakarta.persistence.EntityManager;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class InvoiceService {

    @Autowired
    private IInvoiceRepo invoiceRepository;



    @Autowired
    private IDoctorRepo doctorRepository;

    @Autowired
    private ITestRepo testsRepository;





    public InvoiceService(IInvoiceRepo invoiceRepository, ITestRepo testsRepository,IDoctorRepo doctorRepository) {
        this.invoiceRepository = invoiceRepository;
        this.testsRepository = testsRepository;
        this.doctorRepository = doctorRepository;
    }


    @Transactional
    public Invoice saveInvoice(InvoiceDTO dto) {

        Doctor doctor = doctorRepository.findById(dto.getDoctorId())
                .orElseThrow(() -> new RuntimeException("Doctor must be provided!"));

        List<Tests> tests = testsRepository.findAllById(dto.getTestIds());

        Invoice invoice = new Invoice();
        invoice.setDoctor(doctor);
        invoice.setTests(tests);
        invoice.setDiscount(dto.getDiscount());
        invoice.setInvoiceDate(dto.getInvoiceDate());
        invoice.setDeliveryDate(dto.getDeliveryDate());
        invoice.setDeliveryTime(dto.getDeliveryTime());
        invoice.setPatientName(dto.getPatientName());
        invoice.setPatientContact(dto.getPatientContact());
        invoice.setPreparedBy(dto.getPreparedBy());
        invoice.setDue(dto.getDue());
        invoice.setReceived(dto.getReceived());

        invoice.calculateTotal();

        return invoiceRepository.save(invoice);
    }


    public List<Invoice> getAllInvoices() {
             return invoiceRepository.findAll();
    }

    public Optional<Invoice> getInvoiceById(Long id) {
             return invoiceRepository.findById(id);
    }

}
