package com.emranhss.hospital.service;


import com.emranhss.hospital.dto.ReportDTO;
import com.emranhss.hospital.entity.Doctor;
import com.emranhss.hospital.entity.Report;
import com.emranhss.hospital.repository.IDoctorRepo;
import com.emranhss.hospital.repository.IReportRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ReportService {

    @Autowired
    private IReportRepo reportRepository;

    @Autowired
    private IDoctorRepo doctorRepository;


    public ReportDTO save(ReportDTO dto) {
        Doctor doctor = doctorRepository.findById(dto.getDoctorId())
                .orElseThrow(() -> new RuntimeException("Doctor not found with id " + dto.getDoctorId()));

        Report report = new Report();
        report.setReportResult(dto.getReportResult());
        report.setDescription(dto.getDescription());
        report.setSampleId(dto.getSampleId());
        report.setInterpretation(dto.getInterpretation());
        report.setPatientName(dto.getPatientName());
        report.setTestDate(dto.getTestDate());
        report.setCreateDate(dto.getCreateDate());
        report.setDeliveryDate(dto.getDeliveryDate());
        report.setDoctor(doctor);
        report.setPatientContact(dto.getPatientContact());
        report.setGender(dto.getGender());
        report.setPreparedBy(dto.getPreparedBy());

        if(report.getSampleId() == null || report.getSampleId().isEmpty()) {
            report.setSampleId("SMP-" + System.currentTimeMillis());
        }

        Report saved = reportRepository.save(report);

        Doctor savedDoctor = saved.getDoctor();

        return new ReportDTO(
                saved.getId(),
                saved.getReportResult(),
                saved.getDescription(),
                saved.getSampleId(),
                saved.getInterpretation(),
                saved.getPatientName(),
                saved.getPatientContact(),
                saved.getPreparedBy(),
                saved.getGender(),
                saved.getTestDate(),
                saved.getCreateDate(),
                saved.getDeliveryDate(),
                savedDoctor != null ? savedDoctor.getId() : null,
                savedDoctor != null ? savedDoctor.getName() : "Unknown"
        );
    }


    
    public List<ReportDTO> getAllReportsDTO() {
        List<Report> reports = reportRepository.findAll();

        return reports.stream().map(r -> {
            Doctor doc = r.getDoctor();
            return new ReportDTO(
                    r.getId(),
                    r.getReportResult(),
                    r.getDescription(),
                    r.getSampleId(),
                    r.getInterpretation(),
                    r.getPatientName(),
                    r.getPatientContact(),
                    r.getPreparedBy(),
                    r.getGender(),
                    r.getTestDate(),
                    r.getCreateDate(),
                    r.getDeliveryDate(),
                    doc != null ? doc.getId() : null,
                    doc != null ? doc.getName() : "Unknown"
            );
        }).toList();
    }

    public Optional<Report> getReportById(Long id) {
        return reportRepository.findById(id);
    }
}
