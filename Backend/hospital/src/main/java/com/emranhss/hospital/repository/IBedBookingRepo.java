package com.emranhss.hospital.repository;


import com.emranhss.hospital.dto.BedBookingDTO;
import com.emranhss.hospital.dto.BedBookingViewDto;
import com.emranhss.hospital.entity.Bed;
import com.emranhss.hospital.entity.BedBooking;
import com.emranhss.hospital.entity.Meal;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface IBedBookingRepo  extends JpaRepository<BedBooking,Long> {

    BedBooking findTopByBedOrderByAdmissionDateDesc(Bed bed);


    @Query("SELECT new com.emranhss.hospital.dto.BedBookingViewDto(" +
            "b.patientName, b.age, b.address, b.phone, " +
            "b.admissionDate, b.dischargeDate, bed.id, bed.bedNumber, b.id) " +
            "FROM BedBooking b JOIN b.bed bed")
    List<BedBookingViewDto> findAllBookingDetails();




    @Query("SELECT new com.emranhss.hospital.dto.BedBookingViewDto(" +
            "b.patientName, b.age, b.address, b.phone, " +
            "b.admissionDate, b.dischargeDate, bed.id, bed.bedNumber, b.id ) " +
            "FROM BedBooking b JOIN b.bed bed " +
            "WHERE b.phone = :phone")
    List<BedBookingViewDto> findBookingDetailsByPhone(@Param("phone") String phone);




    @Query("SELECT new com.emranhss.hospital.dto.BedBookingViewDto(" +
            "b.patientName, b.age, b.address, b.phone, " +
            "b.admissionDate, b.dischargeDate, bed.id, bed.bedNumber, b.id ) " +
            "FROM BedBooking b JOIN b.bed bed " +
            "WHERE bed.bedNumber = :bedNumber")
    List<BedBookingViewDto> findBookingDetailsByBedNumber(@Param("bedNumber") String bedNumber);


    Optional<BedBooking> findTopByBedIdOrderByAdmissionDateDesc(Long bedId);


//    List<Meal> findByBedBookingId(Long bedBookingId);
}
