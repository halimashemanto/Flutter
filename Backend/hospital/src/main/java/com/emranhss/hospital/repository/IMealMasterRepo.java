package com.emranhss.hospital.repository;


import com.emranhss.hospital.entity.MealMaster;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IMealMasterRepo extends JpaRepository<MealMaster,Long> {



}
