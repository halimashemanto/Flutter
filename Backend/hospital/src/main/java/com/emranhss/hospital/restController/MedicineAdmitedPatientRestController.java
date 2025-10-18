package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.MedicineAdmitedPatientDTO;
import com.emranhss.hospital.dto.PatientMedicineDetailsDTO;
import com.emranhss.hospital.entity.MedicineAdmitedPatient;
import com.emranhss.hospital.service.MedicineAdmitedPatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/medicine-admitted")
public class MedicineAdmitedPatientRestController {




    @Autowired
    private MedicineAdmitedPatientService service;

    // ✅ Add a new medicine entry
    @PostMapping
    public MedicineAdmitedPatientDTO addMedicine(@RequestBody MedicineAdmitedPatientDTO dto) {
        MedicineAdmitedPatient med = service.addMedicine(dto);

        // Convert entity to DTO
        MedicineAdmitedPatientDTO response = new MedicineAdmitedPatientDTO();
        response.setId(med.getId());
        response.setBedBookingId(med.getBedBooking().getId());
        response.setPharmacyMedicineId(med.getPharmacyMedicine().getId());
        response.setMedicineName(med.getPharmacyMedicine().getName());
        response.setSellingPrice(med.getPharmacyMedicine().getSellingPrice());
        response.setQuantity(med.getQuantity());
        response.setApplyWay(med.getApplyWay());
        response.setDate(med.getDate());
        response.setTotalCost(med.getTotalCost());

        return response;
    }

    // ✅ Get all medicines for a bed booking
    @GetMapping("/bed/{bedBookingId}")
    public List<MedicineAdmitedPatientDTO> getPatientMedicines(@PathVariable Long bedBookingId) {
        return service.getPatientMedicines(bedBookingId);
    }

    // ✅ Delete a medicine entry
    @DeleteMapping("/{id}")
    public void deleteMedicine(@PathVariable Long id) {
        service.deleteMedicine(id);
    }

    // ✅ Optional: get total cost for a bed booking
    @GetMapping("/bed/{bedBookingId}/total-cost")
    public double getTotalCost(@PathVariable Long bedBookingId) {
        return service.calculateTotalCost(bedBookingId);
    }



    // Get patient info + medicines (auto load)
    @GetMapping("/bedbooking/{id}/patient")
    public PatientMedicineDetailsDTO getPatientByBedBooking(@PathVariable Long id) {
        return service.getPatientDetails(id);
    }
}
