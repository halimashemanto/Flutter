package com.emranhss.hospital.service;


import com.emranhss.hospital.dto.DoctorDTO;
import com.emranhss.hospital.entity.Department;
import com.emranhss.hospital.entity.Doctor;
import com.emranhss.hospital.repository.IDepartmentRepository;
import com.emranhss.hospital.repository.IDoctorRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class DoctorService {


    @Autowired
    private IDoctorRepo doctorRepository;

    public List<Doctor> getAll() {
        return doctorRepository.findAll();
    }

    public Optional<Doctor> getById(Long id) {
        return doctorRepository.findById(id);
    }

    public Doctor save(Doctor doctor) {
        return doctorRepository.save(doctor);
    }

    public void delete(Long id) {
        doctorRepository.deleteById(id);
    }

    public Doctor getProfileByUserId(long userId) {
        return doctorRepository.findByUserId(userId)
                .orElseThrow(() -> new RuntimeException("Doctor not found"));
    }

//    ei getDoctorById slot pawar jnno banaici

    public Doctor getDoctorById(Long doctorId) {
        return doctorRepository.findById(doctorId)
                .orElseThrow(() -> new RuntimeException("Doctor not found with id " + doctorId));
    }



    public List<DoctorDTO> getDoctorsByDepartment(Long departmentId) {
        return doctorRepository.findByDepartmentId(departmentId)
                .stream()
                .map(d -> new DoctorDTO(
                        d.getId(),
                        d.getName(),
                        d.getEmail(),
                        d.getPhone(),
                        d.getGender(),
                        d.getStatus(),
                        d.getStudy(),
                        d.getChamber(),
                        d.getJoinDate(),
                        d.getPhoto(),
                        d.getDepartment() != null ? d.getDepartment().getId() : null,
                        d.getDepartment() != null ? d.getDepartment().getDepartmentName() : null,
                        d.getDepartment() != null ? d.getDepartment().getDescription() : null
                ))
                .collect(Collectors.toList());
    }

    public Optional<Doctor> getDoctorByEmail(String email) {
        return doctorRepository.findByEmail(email);
    }


}
