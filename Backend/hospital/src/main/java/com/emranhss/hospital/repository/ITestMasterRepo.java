package com.emranhss.hospital.repository;

import com.emranhss.hospital.dto.TestAdmitedPatientDTO;
import com.emranhss.hospital.entity.TestMaster;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ITestMasterRepo extends JpaRepository<TestMaster, Long> {
}
