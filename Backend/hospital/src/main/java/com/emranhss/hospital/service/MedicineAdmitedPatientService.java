package com.emranhss.hospital.service;


import com.emranhss.hospital.dto.MedicineAdmitedPatientDTO;
import com.emranhss.hospital.dto.PatientMedicineDetailsDTO;
import com.emranhss.hospital.entity.BedBooking;
import com.emranhss.hospital.entity.MedicineAdmitedPatient;
import com.emranhss.hospital.entity.PharmacyMedicine;
import com.emranhss.hospital.repository.IBedBookingRepo;
import com.emranhss.hospital.repository.IMedicineAdmittedPatientRepo;
import com.emranhss.hospital.repository.IPharmacyMedicineRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class MedicineAdmitedPatientService {



    @Autowired
    private IMedicineAdmittedPatientRepo repo;

    @Autowired
    private IBedBookingRepo bedBookingRepo;

    @Autowired
    private IPharmacyMedicineRepo pharmacyRepo;

    // Add a new medicine entry
    public MedicineAdmitedPatient addMedicine(MedicineAdmitedPatientDTO dto) {
        MedicineAdmitedPatient med = new MedicineAdmitedPatient();

        // ✅ Fetch existing BedBooking
        BedBooking booking = bedBookingRepo.findById(dto.getBedBookingId())
                .orElseThrow(() -> new RuntimeException("BedBooking not found"));
        med.setBedBooking(booking);

        // ✅ Fetch existing PharmacyMedicine
        PharmacyMedicine pm = pharmacyRepo.findById(dto.getPharmacyMedicineId())
                .orElseThrow(() -> new RuntimeException("PharmacyMedicine not found"));
        med.setPharmacyMedicine(pm);

        med.setApplyWay(dto.getApplyWay());
        med.setQuantity(dto.getQuantity());

        // ✅ এখানে calculation হবে
        double total = dto.getQuantity() * pm.getSellingPrice();
        med.setTotalCost(total);

        med.setDate(new Date());

        return repo.save(med);
    }


    // Get all medicines for a bedBooking
    public List<MedicineAdmitedPatientDTO> getPatientMedicines(Long bedBookingId) {
        List<MedicineAdmitedPatient> list = repo.findByBedBookingId(bedBookingId);

        return list.stream().map(med -> {
            MedicineAdmitedPatientDTO dto = new MedicineAdmitedPatientDTO();
            dto.setId(med.getId());
            dto.setBedBookingId(med.getBedBooking().getId());
            dto.setPharmacyMedicineId(med.getPharmacyMedicine().getId());
            dto.setMedicineName(med.getPharmacyMedicine().getName());
            dto.setSellingPrice(med.getPharmacyMedicine().getSellingPrice());
            dto.setQuantity(med.getQuantity());
            dto.setApplyWay(med.getApplyWay());
            dto.setDate(med.getDate());
            dto.setTotalCost(med.getTotalCost());
            return dto;
        }).collect(Collectors.toList());
    }

    public PatientMedicineDetailsDTO getPatientDetails(Long bedBookingId) {
        BedBooking booking = bedBookingRepo.findById(bedBookingId)
                .orElseThrow(() -> new RuntimeException("BedBooking not found"));

        PatientMedicineDetailsDTO dto = new PatientMedicineDetailsDTO();
        dto.setPatientName(booking.getPatientName());
        dto.setAge(booking.getAge());
        dto.setPhone(booking.getPhone());
        dto.setAddress(booking.getAddress());

        // medicines
        List<MedicineAdmitedPatientDTO> meds = getPatientMedicines(bedBookingId);
        dto.setMedicines(meds);

        return dto;
    }


    // Delete a medicine entry
    public void deleteMedicine(Long id) {
        repo.deleteById(id);
    }

    // Optional: calculate total cost for patient
    public double calculateTotalCost(Long bedBookingId) {
        List<MedicineAdmitedPatient> list = repo.findByBedBookingId(bedBookingId);
        return list.stream().mapToDouble(MedicineAdmitedPatient::getTotalCost).sum();
    }
}
