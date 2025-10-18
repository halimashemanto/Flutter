package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.Doctor;
import com.emranhss.hospital.entity.Tests;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ITestRepo extends JpaRepository<Tests,Long> {

    Optional<Tests> findById(long testId);
}
