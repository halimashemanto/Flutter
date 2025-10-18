package com.emranhss.hospital.service;

import com.emranhss.hospital.dto.OfficeStaffDTO;
import com.emranhss.hospital.dto.ReceptionistDTO;
import com.emranhss.hospital.entity.Doctor;
import com.emranhss.hospital.entity.OfficeStaff;
import com.emranhss.hospital.entity.Receptionist;
import com.emranhss.hospital.repository.IDoctorRepo;
import com.emranhss.hospital.repository.INurseRepo;
import com.emranhss.hospital.repository.IReceptionistRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ReceptionistService {

    @Autowired
    private IReceptionistRepo receptionistRepository;


    public List<Receptionist> getAll() {
        return receptionistRepository.findAll();
    }

    public Optional<Receptionist> getById(Long id) {
        return receptionistRepository.findById(id);
    }

    public Receptionist save(Receptionist receptionist) {
        return receptionistRepository.save(receptionist);
    }

    public void delete(Long id) {
        receptionistRepository.deleteById(id);
    }

    public Receptionist getProfileByUserId(long userId) {
        return receptionistRepository.findByUserId(userId)
                .orElseThrow(() -> new RuntimeException("Doctor not found"));
    }





    public ReceptionistDTO getReceptionistProfile(String email) {
        Receptionist receptionist = receptionistRepository.findByEmail(email).orElse(null);
        return mapToDTO(receptionist);
    }

    private ReceptionistDTO mapToDTO(Receptionist receptionist) {
        if (receptionist == null) return null;

        ReceptionistDTO dto = new ReceptionistDTO();
        dto.setId(receptionist.getId());
        dto.setName(receptionist.getName());
        dto.setEmail(receptionist.getEmail());
        dto.setAddress(receptionist.getAddress());
        dto.setPhone(receptionist.getPhone());
        dto.setGender(receptionist.getGender());
        dto.setStatus(receptionist.getStatus());
        dto.setJoinDate(receptionist.getJoinDate());
        dto.setPhoto(receptionist.getPhoto());



        return dto;
    }









}
