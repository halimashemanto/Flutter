package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.Nurse;
import com.emranhss.hospital.entity.OfficeStaff;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface IOfficeStaffRepo extends JpaRepository<OfficeStaff,Long> {

    Optional<OfficeStaff> findByUserId(long userId);


    Optional<OfficeStaff> findByEmail(String email);
}
