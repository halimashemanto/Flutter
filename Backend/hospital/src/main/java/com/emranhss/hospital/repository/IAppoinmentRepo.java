package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.Appoinment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface IAppoinmentRepo extends JpaRepository<Appoinment,Long> {

  List<Appoinment> findByDoctorId(Long doctorId);
Optional<Appoinment> findTopByDoctorIdOrderByIdDesc(Long doctorId);


  @Query("SELECT a FROM Appoinment a " +
          "LEFT JOIN FETCH a.doctor " +
          "LEFT JOIN FETCH a.department " +
          "LEFT JOIN FETCH a.scheduleSlot")
  List<Appoinment> findAllWithRelations();

}
