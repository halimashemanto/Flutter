package com.emranhss.hospital.service;

import com.emranhss.hospital.entity.Doctor;
import com.emranhss.hospital.entity.Patient;
import com.emranhss.hospital.repository.IDepartmentRepository;
import com.emranhss.hospital.repository.IDoctorRepo;
import com.emranhss.hospital.repository.IPatientRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PatientService {

    @Autowired
    private IPatientRepo patientRepository;

    @Autowired
    private IDoctorRepo doctorRepo;
    @Autowired
    private IDepartmentRepository departmentRepo;

   public List<Patient> getAll() {
        return patientRepository.findAll();
   }

    public Optional<Patient> getById(Long id) {
        return patientRepository.findById(id);
    }

    public Patient save(Patient patient) {
        return patientRepository.save(patient);
    }

    public void delete(Long id) {
        patientRepository.deleteById(id);
    }









}


