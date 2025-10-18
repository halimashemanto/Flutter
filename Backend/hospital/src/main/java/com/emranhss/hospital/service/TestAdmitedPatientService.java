package com.emranhss.hospital.service;


import com.emranhss.hospital.dto.TestAdmitedPatientDTO;
import com.emranhss.hospital.entity.BedBooking;
import com.emranhss.hospital.entity.TestAdmitedPatient;
import com.emranhss.hospital.entity.TestMaster;
import com.emranhss.hospital.repository.IBedBookingRepo;
import com.emranhss.hospital.repository.ITestAdmitedPatientRepo;
import com.emranhss.hospital.repository.ITestMasterRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class TestAdmitedPatientService {

    @Autowired
    private ITestAdmitedPatientRepo testPatientRepo;
    @Autowired
    private IBedBookingRepo bedBookingRepo;
    @Autowired
    private ITestMasterRepo testMasterRepo;


    public TestAdmitedPatientDTO saveTestsForPatient(TestAdmitedPatientDTO dto) {
        BedBooking bedBooking = bedBookingRepo.findById(dto.getBedBookingId())
                .orElseThrow(() -> new RuntimeException("BedBooking not found"));

        List<TestMaster> selectedTests = testMasterRepo.findAllById(dto.getTestIds());

        double totalCost = selectedTests.stream()
                .mapToDouble(TestMaster::getTestPrice)
                .sum();

        TestAdmitedPatient tap = new TestAdmitedPatient();
        tap.setBedBooking(bedBooking);
        tap.setSelectedTests(selectedTests);
        tap.setTestCost(totalCost);

        testPatientRepo.save(tap);

        // Build DTO for response
        dto.setId(tap.getId());
        dto.setPatientName(bedBooking.getPatientName());
        dto.setAge(bedBooking.getAge());
        dto.setPhone(bedBooking.getPhone());
        dto.setAddress(bedBooking.getAddress());
        dto.setTestCost(totalCost);
        dto.setSelectedTests(selectedTests.stream()
                .map(t -> new TestAdmitedPatientDTO.TestInfoDTO(t.getId(), t.getTestName(), t.getTestPrice()))
                .collect(Collectors.toList()));

        return dto;
    }

    // Get tests by bedBookingId
    public TestAdmitedPatientDTO getTestsByBedBooking(Long bedBookingId) {
        BedBooking bedBooking = bedBookingRepo.findById(bedBookingId)
                .orElseThrow(() -> new RuntimeException("BedBooking not found"));

        List<TestAdmitedPatient> patientTests = testPatientRepo.findByBedBooking_Id(bedBookingId);

        double totalCost = patientTests.stream()
                .flatMap(t -> t.getSelectedTests().stream())
                .mapToDouble(TestMaster::getTestPrice)
                .sum();

        List<TestAdmitedPatientDTO.TestInfoDTO> testInfoList = patientTests.stream()
                .flatMap(t -> t.getSelectedTests().stream())
                .map(t -> new TestAdmitedPatientDTO.TestInfoDTO(t.getId(), t.getTestName(), t.getTestPrice()))
                .collect(Collectors.toList());

        TestAdmitedPatientDTO dto = new TestAdmitedPatientDTO();
        dto.setBedBookingId(bedBookingId);
        dto.setPatientName(bedBooking.getPatientName());
        dto.setAge(bedBooking.getAge());
        dto.setPhone(bedBooking.getPhone());
        dto.setAddress(bedBooking.getAddress());
        dto.setTestCost(totalCost);
        dto.setSelectedTests(testInfoList);

        return dto;
    }




}
