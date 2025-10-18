package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;


@Repository
public interface IDepartmentRepository  extends JpaRepository<Department, Long> {
    Optional<Department> findById(long departmentId);

}