package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.Purchase;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IPurchaseRepo extends JpaRepository<Purchase,Long> {
}
