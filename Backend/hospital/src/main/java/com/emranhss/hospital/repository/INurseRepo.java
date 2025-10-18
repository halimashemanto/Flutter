package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.Doctor;
import com.emranhss.hospital.entity.Nurse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface INurseRepo extends JpaRepository<Nurse, Long> {


    Optional<Nurse> findByUserId(long userId);

    Optional<Nurse> findByEmail(String email);
}
