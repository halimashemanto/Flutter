package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.PharmacyMedicine;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IPharmacyMedicineRepo  extends JpaRepository<PharmacyMedicine,Long> {
}
