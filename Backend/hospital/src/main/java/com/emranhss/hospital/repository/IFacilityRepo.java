package com.emranhss.hospital.repository;


import com.emranhss.hospital.entity.Facility;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IFacilityRepo  extends JpaRepository<Facility,Long> {

    List<Facility> findByWardId(Long wardId);
}
