package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.Medicine;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IMedicineRepo extends JpaRepository<Medicine,Long> {
}
