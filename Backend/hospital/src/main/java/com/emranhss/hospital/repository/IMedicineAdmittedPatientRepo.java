package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.MedicineAdmitedPatient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface IMedicineAdmittedPatientRepo extends JpaRepository<MedicineAdmitedPatient, Long> {


    List<MedicineAdmitedPatient> findByBedBookingId(Long bedBookingId);

    List<MedicineAdmitedPatient> findByBedBooking_IdAndDate(Long bedBookingId, java.util.Date date);

    List<MedicineAdmitedPatient> findByBedBookingIdAndDate(Long bedBookingId, java.util.Date date);
}
