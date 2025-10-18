package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.ReportDTO;
import com.emranhss.hospital.entity.Report;
import com.emranhss.hospital.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/report")
public class ReportRestController {

    @Autowired
    private ReportService reportService;


    public ReportRestController(ReportService reportService) {
        this.reportService = reportService;
    }

    @PostMapping("")
    public ReportDTO createReport(@RequestBody ReportDTO dto) {
        return reportService.save(dto);
    }

    @GetMapping
    public ResponseEntity<List<ReportDTO>> getAllReports() {
        return ResponseEntity.ok(reportService.getAllReportsDTO());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Report> getReportById(@PathVariable Long id) {
        return reportService.getReportById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

}
