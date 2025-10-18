package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.SaleItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ISaleItemRepo extends JpaRepository<SaleItem,Long> {
}
