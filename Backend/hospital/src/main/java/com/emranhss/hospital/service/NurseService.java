package com.emranhss.hospital.service;

import com.emranhss.hospital.dto.DoctorDTO;
import com.emranhss.hospital.dto.NurseDTO;
import com.emranhss.hospital.entity.Doctor;
import com.emranhss.hospital.entity.Nurse;
import com.emranhss.hospital.repository.IDoctorRepo;
import com.emranhss.hospital.repository.INurseRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class NurseService {


    @Autowired
    private INurseRepo nurseRepository;



    public List<Nurse> getAll() {
        return nurseRepository.findAll();
    }

    public Optional<Nurse> getById(Long id) {
        return nurseRepository.findById(id);
    }

    public Nurse save(Nurse nurse) {
        return nurseRepository.save(nurse);
    }

    public void delete(Long id) {
        nurseRepository.deleteById(id);
    }

    public Nurse getProfileByUserId(long userId) {
        return nurseRepository.findByUserId(userId)
                .orElseThrow(() -> new RuntimeException("Nurse not found"));
    }



    public Optional<Nurse> getNurseByEmail(String email) {
        return nurseRepository.findByEmail(email);
    }



    public NurseDTO getNurseProfile(String email) {
        Nurse nurse = nurseRepository.findByEmail(email).orElse(null);
        return mapToDTO(nurse);
    }



    private NurseDTO mapToDTO(Nurse nurse) {
        if (nurse == null) return null;

        return new NurseDTO(
                nurse.getId(),
                nurse.getName(),
                nurse.getEmail(),
                nurse.getPhone(),
                nurse.getAddress(),
                nurse.getNurseType(),
                nurse.getGender(),
                nurse.getShift(),
                nurse.getWorkingHours(),
                nurse.getPhoto(),
                nurse.getJoinDate()
        );
    }









}
