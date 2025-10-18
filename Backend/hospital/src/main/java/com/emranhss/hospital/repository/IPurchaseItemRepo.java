package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.PurchaseItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IPurchaseItemRepo extends JpaRepository<PurchaseItem,Long> {
}
