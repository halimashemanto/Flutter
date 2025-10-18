package com.emranhss.hospital.repository;


import com.emranhss.hospital.entity.EmergencyPatient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IEmergencyPatientRepo extends JpaRepository<EmergencyPatient, Long> {
}
