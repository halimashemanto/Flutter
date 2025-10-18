package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.*;
import com.emranhss.hospital.service.WordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/ward")
public class WordRestController {

    @Autowired
    private WordService service;

    @Autowired
    public WordRestController(WordService service) {
        this.service = service;
    }

    // === Ward ===
    @PostMapping
    public WardDTO createWard(@RequestBody WardDTO ward) {
        return service.createWard(ward);
    }

    @GetMapping
    public List<WardDTO> getAllWards() {
        return service.getAllWards();
    }

    // === Beds ===
    @PostMapping("/{wardId}/beds")
    public BedDTO createBed(@PathVariable Long wardId, @RequestBody BedDTO bed) {
        return service.createBed(wardId, bed);
    }

    @GetMapping("/{wardId}/beds")
    public List<BedDTO> getBeds(@PathVariable Long wardId) {
        return service.getBeds(wardId);
    }

    // === Available / Occupied Beds ===
    @GetMapping("/{wardId}/beds/available")
    public List<BedDTO> getAvailableBeds(@PathVariable Long wardId) {
        return service.getAvailableBeds(wardId);
    }

    @GetMapping("/{wardId}/beds/occupied")
    public List<BedDTO> getOccupiedBeds(@PathVariable Long wardId) {
        return service.getOccupiedBeds(wardId);
    }

    // === Facilities ===
    @PostMapping("/{wardId}/facilities")
    public FacilityDTO addFacility(@PathVariable Long wardId, @RequestBody FacilityDTO facility) {
        return service.addFacility(wardId, facility);
    }

    @GetMapping("/{wardId}/facilities")
    public List<FacilityDTO> getFacilities(@PathVariable Long wardId) {
        return service.getFacilities(wardId);
    }

    // === Daily Charge Calculation ===
    @GetMapping("/{wardId}/beds/{bedId}/charge")
    public Map<String, Object> calculateBedCharge(
            @PathVariable Long wardId,
            @PathVariable Long bedId,
            @RequestParam int days) {  // admission → discharge days

        double total = service.calculateBedCharge(bedId, days);

        return Map.of(
                "wardId", wardId,
                "bedId", bedId,
                "days", days,
                "totalCharge", total
        );
    }


    // Bed Booking
    @PostMapping("/beds/{bedId}/book")
    public BedBookingDTO bookBed(@PathVariable Long bedId, @RequestBody BedBookingDTO dto) {
        dto.setBedId(bedId);
        return service.bookBed(dto);
    }

    // Bed Release
    @PostMapping("/beds/{bedId}/release")
    public BedBookingDTO releaseBed(@PathVariable Long bedId) {
        return service.releaseBed(bedId);
    }


    @GetMapping("/bed-bookings/details")    //   http://localhost:8080/api/ward/bed-bookings/details
    public List<BedBookingViewDto> getBedBookingDetails() {
        return service.getAllBookingDetails();
    }


    @GetMapping("/bed-bookings/phone/{phone}")     //  http://localhost:8080/api/ward/bed-bookings/phone/019123456789
    public List<BedBookingViewDto> getByPhone(@PathVariable String phone) {
        return service.getBookingDetailsByPhone(phone);
    }


    @GetMapping("/bed-bookings/bedNumber/{bedNumber}")     //  http://localhost:8080/api/ward/bed-bookings/bedNumber/202-F
    public List<BedBookingViewDto> getByBedNumber(@PathVariable String bedNumber) {
        return service.getBookingDetailsByBedNumber(bedNumber);
    }


}
