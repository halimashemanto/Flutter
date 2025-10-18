package com.emranhss.hospital.service;


import com.emranhss.hospital.dto.EmergencyPatientDTO;
import com.emranhss.hospital.entity.Doctor;
import com.emranhss.hospital.entity.EmergencyPatient;
import com.emranhss.hospital.entity.Patient;
import com.emranhss.hospital.repository.IDoctorRepo;
import com.emranhss.hospital.repository.IEmergencyPatientRepo;
import com.emranhss.hospital.repository.IPatientRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;



@Service
public class EmergencyPatientService {

    @Autowired
    private IEmergencyPatientRepo  emergencyPatientRepo;




    public EmergencyPatientService(IEmergencyPatientRepo emergencyPatientRepo ) {
                this.emergencyPatientRepo = emergencyPatientRepo;

    }



    public EmergencyPatientDTO createEmergencyPatient(EmergencyPatientDTO dto) {
        EmergencyPatient ep = convertToEntity(dto);
        emergencyPatientRepo.save(ep);
        dto.setId(ep.getId());
        return dto;
    }


    public List<EmergencyPatientDTO> getAllEmergencyPatients() {
        return emergencyPatientRepo.findAll()
                .stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }


    public EmergencyPatientDTO getEmergencyPatientById(Long id) {
        EmergencyPatient ep = emergencyPatientRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("EmergencyPatient not found"));
        return convertToDTO(ep);
    }


    public EmergencyPatientDTO updateEmergencyPatient(Long id, EmergencyPatientDTO dto) {
        EmergencyPatient ep = emergencyPatientRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("EmergencyPatient not found"));


        ep.setAdmissionDate(dto.getAdmissionDate());
        ep.setConditionLevel(dto.getConditionLevel());
        ep.setBroughtBy(dto.getBroughtBy());
        ep.setIncidentDetails(dto.getIncidentDetails());
        ep.setImmediateTreatment(dto.getImmediateTreatment());
        ep.setAdmittedToWard(dto.isAdmittedToWard());
        ep.setStatus(dto.getStatus());

        ep.setPatientName(dto.getPatientName());
        ep.setPatientAge(dto.getPatientAge());
        ep.setPatientGender(dto.getPatientGender());
        ep.setPatientContact(dto.getPatientContact());
        ep.setPatientAddress(dto.getPatientAddress());
        ep.setMedicalHistory(dto.getMedicalHistory());

        emergencyPatientRepo.save(ep);
        return convertToDTO(ep);
    }


    public void deleteEmergencyPatient(Long id) {
        emergencyPatientRepo.deleteById(id);
    }


    private EmergencyPatientDTO convertToDTO(EmergencyPatient ep) {
        EmergencyPatientDTO dto = new EmergencyPatientDTO();
        dto.setId(ep.getId());
        dto.setAdmissionDate(ep.getAdmissionDate());
        dto.setConditionLevel(ep.getConditionLevel());
        dto.setBroughtBy(ep.getBroughtBy());
        dto.setIncidentDetails(ep.getIncidentDetails());
        dto.setImmediateTreatment(ep.getImmediateTreatment());
        dto.setAdmittedToWard(ep.isAdmittedToWard());
        dto.setStatus(ep.getStatus());


        dto.setPatientName(ep.getPatientName());
        dto.setPatientAge(ep.getPatientAge());
        dto.setPatientGender(ep.getPatientGender());
        dto.setPatientContact(ep.getPatientContact());
        dto.setPatientAddress(ep.getPatientAddress());
        dto.setMedicalHistory(ep.getMedicalHistory());


        return dto;
    }

    private EmergencyPatient convertToEntity(EmergencyPatientDTO dto) {
        EmergencyPatient ep = new EmergencyPatient();
        ep.setAdmissionDate(dto.getAdmissionDate());
        ep.setConditionLevel(dto.getConditionLevel());
        ep.setBroughtBy(dto.getBroughtBy());
        ep.setIncidentDetails(dto.getIncidentDetails());
        ep.setImmediateTreatment(dto.getImmediateTreatment());
        ep.setAdmittedToWard(dto.isAdmittedToWard());
        ep.setStatus(dto.getStatus());


        ep.setPatientName(dto.getPatientName());
        ep.setPatientAge(dto.getPatientAge());
        ep.setPatientGender(dto.getPatientGender());
        ep.setPatientContact(dto.getPatientContact());
        ep.setPatientAddress(dto.getPatientAddress());
        ep.setMedicalHistory(dto.getMedicalHistory());

        return ep;
    }
}
