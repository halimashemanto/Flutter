package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.Department;
import com.emranhss.hospital.entity.Doctor;
import com.emranhss.hospital.entity.ScheduleSlot;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface IDoctorRepo extends JpaRepository<Doctor,Long> {

    Optional<Doctor> findByUserId(long userId);

    List<Doctor> findByDepartmentId(Long departmentId);

    Optional<Doctor> findByEmail(String email);


}
