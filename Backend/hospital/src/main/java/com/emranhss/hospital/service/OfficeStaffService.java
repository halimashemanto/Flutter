package com.emranhss.hospital.service;


import com.emranhss.hospital.dto.NurseDTO;
import com.emranhss.hospital.dto.OfficeStaffDTO;
import com.emranhss.hospital.entity.Doctor;
import com.emranhss.hospital.entity.Nurse;
import com.emranhss.hospital.entity.OfficeStaff;
import com.emranhss.hospital.repository.IDoctorRepo;
import com.emranhss.hospital.repository.INurseRepo;
import com.emranhss.hospital.repository.IOfficeStaffRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OfficeStaffService {
    @Autowired
    private IOfficeStaffRepo officeStaffRepo;



    public List<OfficeStaff> getAll() {
        return officeStaffRepo.findAll();
    }

    public Optional<OfficeStaff> getById(Long id) {
        return officeStaffRepo.findById(id);
    }

    public OfficeStaff save(OfficeStaff officeStaff) {
        return officeStaffRepo.save(officeStaff);
    }

    public void delete(Long id) {
        officeStaffRepo.deleteById(id);
    }

    public OfficeStaff getProfileByUserId(long userId) {
        return officeStaffRepo.findByUserId(userId)
                .orElseThrow(() -> new RuntimeException("Office Staff not found"));
    }




    public OfficeStaffDTO getOfficeStaffProfile(String email) {
        OfficeStaff officeStaff = officeStaffRepo.findByEmail(email).orElse(null);
        return mapToDTO(officeStaff);
    }



    private OfficeStaffDTO mapToDTO(OfficeStaff officeStaff) {
        if (officeStaff == null) return null;

        OfficeStaffDTO dto = new OfficeStaffDTO();
        dto.setId(officeStaff.getId());
        dto.setName(officeStaff.getName());
        dto.setEmail(officeStaff.getEmail());
        dto.setPhone(officeStaff.getPhone());
        dto.setGender(officeStaff.getGender());
        dto.setPosition(officeStaff.getPosition());
        dto.setAge(officeStaff.getAge());
        dto.setDepartment(officeStaff.getDepartment());
        dto.setWorkingHours(officeStaff.getWorkingHours());
        dto.setJoinDate(officeStaff.getJoinDate());
        dto.setPhoto(officeStaff.getPhoto());

        return dto;
    }


}
