package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.Prescription;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface IPrescriptionRepo extends JpaRepository<Prescription,Long> {


    @Query("SELECT p FROM Prescription p " +
            "JOIN FETCH p.doctor " +
            "LEFT JOIN FETCH p.tests " +
            "LEFT JOIN FETCH p.medicines " +
            "WHERE p.id = :id")
    Prescription findByIdWithAll(@Param("id") Long id);

}
