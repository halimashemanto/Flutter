package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.PatientDTO;
import com.emranhss.hospital.entity.*;
import com.emranhss.hospital.repository.IDepartmentRepository;
import com.emranhss.hospital.repository.IDoctorRepo;
import com.emranhss.hospital.repository.IPatientRepo;
import com.emranhss.hospital.service.PatientService;
import com.emranhss.hospital.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/patient/")

public class PatientRestController {
    @Autowired
    private PatientService patientService;

    @Autowired
    private IDoctorRepo doctorRepo;

    @Autowired
    private IDepartmentRepository departmentRepo;

    // ✅ Get all patients
    @GetMapping
    public ResponseEntity<List<Patient>> getAllPatients() {
        return ResponseEntity.ok(patientService.getAll());
    }

    // ✅ Get patient by id
    @GetMapping("/{id}")
    public ResponseEntity<Patient> getPatientById(@PathVariable Long id) {
        Optional<Patient> patientOpt = patientService.getById(id);
        return patientOpt.map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // ✅ Save new patient
    @PostMapping
    public ResponseEntity<Patient> createPatient(@RequestBody Patient patient) {
        // Optional: validate doctor exists
        if (patient.getDoctor() != null) {
            Optional<Doctor> doctorOpt = doctorRepo.findById(patient.getDoctor().getId());
            if (!doctorOpt.isPresent()) {
                return ResponseEntity.badRequest().build();
            }
            patient.setDoctor(doctorOpt.get());
        }
        Patient savedPatient = patientService.save(patient);
        return ResponseEntity.ok(savedPatient);
    }

    // ✅ Update patient
    @PutMapping("/{id}")
    public ResponseEntity<Patient> updatePatient(@PathVariable Long id, @RequestBody Patient patient) {
        Optional<Patient> existingPatientOpt = patientService.getById(id);
        if (!existingPatientOpt.isPresent()) {
            return ResponseEntity.notFound().build();
        }

        Patient existingPatient = existingPatientOpt.get();
        existingPatient.setName(patient.getName());
        existingPatient.setGender(patient.getGender());
        existingPatient.setDoctor(patient.getDoctor());
        // add more fields if needed

        Patient updatedPatient = patientService.save(existingPatient);
        return ResponseEntity.ok(updatedPatient);
    }

    // ✅ Delete patient
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletePatient(@PathVariable Long id) {
        Optional<Patient> existingPatientOpt = patientService.getById(id);
        if (!existingPatientOpt.isPresent()) {
            return ResponseEntity.notFound().build();
        }
        patientService.delete(id);
        return ResponseEntity.noContent().build();
    }



}

