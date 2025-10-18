package com.emranhss.hospital.repository;


import com.emranhss.hospital.entity.Ward;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IWordRepo  extends JpaRepository<Ward,Long> {
}
