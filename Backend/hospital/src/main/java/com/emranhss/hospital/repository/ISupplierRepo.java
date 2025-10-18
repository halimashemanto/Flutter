package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ISupplierRepo extends JpaRepository<Supplier,Long> {
}
