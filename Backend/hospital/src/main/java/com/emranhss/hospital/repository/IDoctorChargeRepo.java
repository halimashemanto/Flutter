package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.DoctorCharge;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface IDoctorChargeRepo extends JpaRepository<DoctorCharge, Long> {

    List<DoctorCharge> findByBedBookingId(Long bedBookingId);

}
