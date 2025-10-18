package com.emranhss.hospital.service;


import com.emranhss.hospital.Mapper.WardMapper;
import com.emranhss.hospital.dto.*;
import com.emranhss.hospital.entity.Bed;
import com.emranhss.hospital.entity.BedBooking;
import com.emranhss.hospital.entity.Facility;
import com.emranhss.hospital.entity.Ward;
import com.emranhss.hospital.repository.IBedBookingRepo;
import com.emranhss.hospital.repository.IBedRepo;
import com.emranhss.hospital.repository.IFacilityRepo;
import com.emranhss.hospital.repository.IWordRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class WordService {

    @Autowired
    private IWordRepo wordRepo;
    @Autowired
    private IFacilityRepo facilityRepo;
    @Autowired
    private IBedRepo bedRepo;
    @Autowired
    private IBedBookingRepo bookingRepo;
    @Autowired
    private IBedBookingRepo iBedBookingRepo;

    @Autowired
        public WordService(IWordRepo wardRepo, IBedRepo bedRepo, IFacilityRepo facilityRepo) {
            this.wordRepo = wardRepo;
            this.bedRepo = bedRepo;
            this.facilityRepo = facilityRepo;
        }

        // === Ward ===
        public WardDTO createWard(WardDTO dto) {
            Ward ward = new Ward();
            ward.setWardName(dto.getWardName());
            ward.setWardType(dto.getWardType());
            ward.setPricePerDay(dto.getPricePerDay());
            return WardMapper.toDTO(wordRepo.save(ward));
        }

        public List<WardDTO> getAllWards() {
            return wordRepo.findAll().stream()
                    .map(WardMapper::toDTO)
                    .collect(Collectors.toList());
        }

        // === Bed ===
        public BedDTO createBed(Long wardId, BedDTO dto) {
            Ward ward = wordRepo.findById(wardId)
                    .orElseThrow(() -> new RuntimeException("Ward not found with id " + wardId));

            Bed bed = new Bed();
            bed.setBedNumber(dto.getBedNumber());
            bed.setOccupied(false);
            bed.setWard(ward);
            bed.setPricePerDay(dto.getPricePerDay() > 0 ? dto.getPricePerDay() : ward.getPricePerDay());

            return WardMapper.toDTO(bedRepo.save(bed));
        }

        public List<BedDTO> getBeds(Long wardId) {
            return bedRepo.findAll().stream()
                    .filter(b -> b.getWard().getId().equals(wardId))
                    .map(WardMapper::toDTO)
                    .collect(Collectors.toList());
        }

        // === Facility ===
        public FacilityDTO addFacility(Long wardId, FacilityDTO dto) {
            Ward ward = wordRepo.findById(wardId)
                    .orElseThrow(() -> new RuntimeException("Ward not found with id " + wardId));

            Facility f = new Facility();
            f.setName(dto.getName());
            f.setDescription(dto.getDescription());
            f.setAvailable(dto.isAvailable());
            f.setWard(ward);

            return WardMapper.toDTO(facilityRepo.save(f));
        }

        public List<FacilityDTO> getFacilities(Long wardId) {
            return facilityRepo.findByWardId(wardId)
                    .stream()
                    .map(WardMapper::toDTO)
                    .collect(Collectors.toList());
        }

    // getAvailableBeds
    public List<BedDTO> getAvailableBeds(Long wardId) {
        return bedRepo.findAll().stream()
                .filter(b -> b.getWard().getId().equals(wardId) && !b.isOccupied())
                .map(WardMapper::toDTO)
                .collect(Collectors.toList());
    }

    // getOccupiedBeds
    public List<BedDTO> getOccupiedBeds(Long wardId) {
        return bedRepo.findAll().stream()
                .filter(b -> b.getWard().getId().equals(wardId) && b.isOccupied())
                .map(WardMapper::toDTO)
                .collect(Collectors.toList());
    }

    // calculateBedCharge
    public double calculateBedCharge(Long bedId, int days) {
        Bed bed = bedRepo.findById(bedId).orElseThrow(() -> new RuntimeException("Bed not found"));
        if(days <= 0) days = 1; // minimum 1 day
        return bed.getPricePerDay() * days;
    }



    public BedBookingDTO bookBed(BedBookingDTO dto) {
        Bed bed = bedRepo.findById(dto.getBedId()).orElseThrow(() -> new RuntimeException("Bed not found"));

        if(bed.isOccupied()) throw new RuntimeException("Bed is already occupied");

        bed.setOccupied(true);
        bedRepo.save(bed);

        BedBooking booking = new BedBooking();
        booking.setBed(bed);
        booking.setPatientName(dto.getPatientName());
        booking.setAddress(dto.getAddress());
        booking.setAge(dto.getAge());
        booking.setBroughtBy(dto.getBroughtBy());
        booking.setPhone(dto.getPhone());
        booking.setAdmissionDate(dto.getAdmissionDate());
        booking.setDischargeDate(dto.getDischargeDate());

        long days = 1;
        if(dto.getDischargeDate() != null) {
            days = (dto.getDischargeDate().getTime() - dto.getAdmissionDate().getTime()) / (1000*60*60*24);
            if(days < 1) days = 1;
        }

        booking.setTotalCharge(bed.getPricePerDay() * days);
        dto.setTotalCharge(booking.getTotalCharge());

        bookingRepo.save(booking);
        return dto;
    }


    public BedBookingDTO releaseBed(Long bedId) {
        Bed bed = bedRepo.findById(bedId).orElseThrow(() -> new RuntimeException("Bed not found"));

        if(!bed.isOccupied()) throw new RuntimeException("Bed is already free");

        bed.setOccupied(false);
        bedRepo.save(bed);


        BedBooking booking = bookingRepo.findTopByBedOrderByAdmissionDateDesc(bed);
        BedBookingDTO dto = new BedBookingDTO();
        if(booking != null) {
            dto.setBedId(bedId);
            dto.setPatientName(booking.getPatientName());
            dto.setAddress(booking.getAddress());
            dto.setAge(booking.getAge());
            dto.setBroughtBy(booking.getBroughtBy());
            dto.setPhone(booking.getPhone());
            dto.setAdmissionDate(booking.getAdmissionDate());
            dto.setDischargeDate(booking.getDischargeDate());
            dto.setTotalCharge(booking.getTotalCharge());
        }

        return dto;
    }



    public List<BedBookingViewDto> getAllBookingDetails() {
        return iBedBookingRepo.findAllBookingDetails();
    }


    public List<BedBookingViewDto> getBookingDetailsByPhone(String phone) {
        return iBedBookingRepo.findBookingDetailsByPhone(phone);
    }


    public List<BedBookingViewDto> getBookingDetailsByBedNumber(String bedNumber) {
        return iBedBookingRepo.findBookingDetailsByBedNumber(bedNumber);
    }




}
