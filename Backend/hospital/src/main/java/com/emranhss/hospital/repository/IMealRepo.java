package com.emranhss.hospital.repository;

import com.emranhss.hospital.entity.Meal;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IMealRepo extends JpaRepository<Meal,Long> {


    List<Meal> findByBedBookingId(Long bedBookingId);


}
