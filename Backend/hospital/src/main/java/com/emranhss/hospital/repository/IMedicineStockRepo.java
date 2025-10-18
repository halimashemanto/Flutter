package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.MedicineStock;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IMedicineStockRepo extends JpaRepository<MedicineStock,Long> {
}
