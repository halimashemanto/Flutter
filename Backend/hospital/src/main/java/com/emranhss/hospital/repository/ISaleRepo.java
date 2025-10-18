package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.Sale;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ISaleRepo extends JpaRepository<Sale,Long> {
}
