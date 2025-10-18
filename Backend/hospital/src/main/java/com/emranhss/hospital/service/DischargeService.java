package com.emranhss.hospital.service;


import com.emranhss.hospital.dto.DischargeBillDTO;
import com.emranhss.hospital.dto.ItemizedBillDTO;
import com.emranhss.hospital.entity.Bed;
import com.emranhss.hospital.entity.BedBooking;
import com.emranhss.hospital.repository.IBedBookingRepo;
import com.emranhss.hospital.repository.IBedRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DischargeService {


    @Autowired
    private IBedBookingRepo bedBookingRepo;

    @Autowired
    private IBedRepo bedRepo;

    @Autowired
    private BillingService billingService;




    public DischargeBillDTO dischargePatient(Long bedBookingId, Date dischargeDate) {
        BedBooking booking = bedBookingRepo.findById(bedBookingId)
                .orElseThrow(() -> new RuntimeException("BedBooking not found"));

        // 1️⃣ Set discharge date
        booking.setDischargeDate(dischargeDate);
        bedBookingRepo.save(booking);

        // 2️⃣ Release bed
        Bed bed = booking.getBed();
        if (bed != null) {
            bed.setOccupied(false);
            bedRepo.save(bed);
        }

        // 3️⃣ Generate itemized bill
        List<ItemizedBillDTO> items = billingService.getItemizedBill(bedBookingId);
        double total = billingService.getTotalAmount(items);

        // 4️⃣ Prepare DTO
        DischargeBillDTO dto = new DischargeBillDTO();
        dto.setPatientName(booking.getPatientName());
        dto.setAge(booking.getAge());
        dto.setPhone(booking.getPhone());
        dto.setAddress(booking.getAddress());
        dto.setAdmissionDate(booking.getAdmissionDate());
        dto.setDischargeDate(dischargeDate);
        dto.setBillItems(items);
        dto.setTotalAmount(total);

        return dto;
    }




















//    public Map<String, Object> dischargePatient(Long bedBookingId, Date dischargeDate) {
//        BedBooking booking = bedBookingRepo.findById(bedBookingId)
//                .orElseThrow(() -> new RuntimeException("BedBooking not found"));
//
//        // 1️⃣ Set discharge date
//        booking.setDischargeDate(dischargeDate);
//        bedBookingRepo.save(booking);
//
//        // 2️⃣ Release bed
//        Bed bed = booking.getBed();
//        if (bed != null) {
//            bed.setOccupied(false);
//            bedRepo.save(bed);
//        }
//
//        // 3️⃣ Generate itemized bill
//        List<ItemizedBillDTO> items = billingService.getItemizedBill(bedBookingId);
//        double total = billingService.getTotalAmount(items);
//
//        // 4️⃣ Prepare response
//        Map<String, Object> response = new HashMap<>();
//        response.put("patientName", booking.getPatientName());
//        response.put("age", booking.getAge());
//        response.put("phone", booking.getPhone());
//        response.put("address", booking.getAddress());
//        response.put("billItems", items);
//        response.put("totalAmount", total);
//
//        return response;
//    }

}
