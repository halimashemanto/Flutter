package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.AdmittedPatient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IAdmittedPatientRepo extends JpaRepository<AdmittedPatient, Long> {
}
