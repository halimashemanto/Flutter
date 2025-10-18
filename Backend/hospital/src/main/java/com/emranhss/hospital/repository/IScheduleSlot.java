package com.emranhss.hospital.repository;


import com.emranhss.hospital.dto.SlotResponseDTO;
import com.emranhss.hospital.entity.Doctor;
import com.emranhss.hospital.entity.ScheduleSlot;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface IScheduleSlot extends JpaRepository<ScheduleSlot,Long> {

//    Optional<ScheduleSlot> findByDoctorId(long doctorId);

//    public ScheduleSlot findByName(String name);




    List<ScheduleSlot> findByDoctorId(long doctorId);

    @Query("SELECT new com.emranhss.hospital.dto.SlotResponseDTO(" +
            "s.id, s.date, s.startTime, s.endTime, s.isBooked, " +
            "d.name, dep.departmentName) " +
            "FROM ScheduleSlot s " +
            "JOIN s.doctor d " +
            "JOIN d.department dep " +
            "WHERE d.id = :doctorId AND s.isBooked = false")
    List<SlotResponseDTO> findBookedSlotsByDoctorId(@Param("doctorId") Long doctorId);


}
