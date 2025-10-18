package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.OthersCharge;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface IOthersChargeRepo extends JpaRepository<OthersCharge, Long> {

    List<OthersCharge> findByBedBookingId(Long bedBookingId);

}
