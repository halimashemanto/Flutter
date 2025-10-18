package com.emranhss.hospital.service;


import com.emranhss.hospital.dto.ItemizedBillDTO;
import com.emranhss.hospital.entity.*;
import com.emranhss.hospital.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class BillingService {

    @Autowired
    private IBedBookingRepo  bedBookingRepository;

    @Autowired
    private IBedRepo bedRepo;


    @Autowired
    private IMealRepo mealRepository;

    @Autowired
    private IMedicineAdmittedPatientRepo medicineRepository;

    @Autowired
    private ITestAdmitedPatientRepo testRepository;

    @Autowired
    private IDoctorChargeRepo doctorChargeRepository;

    @Autowired
    private IOthersChargeRepo othersChargeRepository;




    public List<ItemizedBillDTO> getItemizedBill(Long bedBookingId) {
        BedBooking bedBooking = bedBookingRepository.findById(bedBookingId)
                .orElseThrow(() -> new RuntimeException("BedBooking not found with ID: " + bedBookingId));

        List<ItemizedBillDTO> billItems = new ArrayList<>();

        long days = 1; // minimum 1 day
        if (bedBooking.getAdmissionDate() != null && bedBooking.getDischargeDate() != null) {
            long diff = bedBooking.getDischargeDate().getTime() - bedBooking.getAdmissionDate().getTime();
            days = (diff / (1000 * 60 * 60 * 24)) + 1; // add 1 to include admission day
        }


        double dailyCharge = bedBooking.getBed() != null ? bedBooking.getBed().getPricePerDay() : 1000; // default 1000
        double bedCharge = dailyCharge * days;


        // 1️⃣ Bed Booking Charge
        billItems.add(new ItemizedBillDTO("Bed Booking", "Bed Charge (" + days + " days)", bedCharge));


        // 2️⃣ Meals
        List<Meal> meals = mealRepository.findByBedBookingId(bedBookingId);
        for (Meal meal : meals) {
            String mealName = meal.getMealMaster() != null ? meal.getMealMaster().getName() : "Meal";
            double mealPrice = meal.getMealMaster() != null ? meal.getMealMaster().getPrice() : meal.getMealCost();
            billItems.add(new ItemizedBillDTO("Meal", mealName, mealPrice));
        }

        // 3️⃣ Medicines
        List<MedicineAdmitedPatient> medicines = medicineRepository.findByBedBookingId(bedBookingId);
        for (MedicineAdmitedPatient med : medicines) {
            String medName = med.getPharmacyMedicine() != null ? med.getPharmacyMedicine().getName() : "Medicine";
            double medPrice = med.getPharmacyMedicine() != null ? med.getPharmacyMedicine().getSellingPrice() : 0;
            billItems.add(new ItemizedBillDTO("Medicine", medName, medPrice));
        }

        // 4️⃣ Tests
        List<TestAdmitedPatient> tests = testRepository.findByBedBookingId(bedBookingId);
        for (TestAdmitedPatient testAdm : tests) {
            if (testAdm.getSelectedTests() != null) {
                for (TestMaster test : testAdm.getSelectedTests()) {
                    billItems.add(new ItemizedBillDTO("Test", test.getTestName(), test.getTestPrice()));
                }
            }
        }

        // 5️⃣ Doctor Charges
        List<DoctorCharge> doctorCharges = doctorChargeRepository.findByBedBookingId(bedBookingId);
        for (DoctorCharge charge : doctorCharges) {
            billItems.add(new ItemizedBillDTO("Doctor Charge", charge.getDescription(), charge.getAmount()));
        }

        // 6️⃣ Other Charges
        List<OthersCharge> otherCharges = othersChargeRepository.findByBedBookingId(bedBookingId);
        for (OthersCharge charge : otherCharges) {
            billItems.add(new ItemizedBillDTO("Other Charge", charge.getDescription(), charge.getAmount()));
        }

        return billItems;
    }

    public double getTotalAmount(List<ItemizedBillDTO> billItems) {
        return billItems.stream().mapToDouble(ItemizedBillDTO::getAmount).sum();
    }















}
