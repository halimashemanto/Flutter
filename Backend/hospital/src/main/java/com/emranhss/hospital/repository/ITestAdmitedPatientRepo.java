package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.TestAdmitedPatient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ITestAdmitedPatientRepo extends JpaRepository<TestAdmitedPatient, Long> {

    List<TestAdmitedPatient> findByBedBooking_Id(Long bedBookingId);

    List<TestAdmitedPatient> findByBedBookingId(Long bedBookingId);
}
