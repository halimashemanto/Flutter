package com.emranhss.hospital.repository;


import com.emranhss.hospital.entity.Report;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IReportRepo extends JpaRepository<Report, Long> {

    List<Report> findByDoctorId(long doctorId);
}
