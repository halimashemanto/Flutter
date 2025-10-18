package com.emranhss.hospital.service;


import com.emranhss.hospital.dto.MealDTO;
import com.emranhss.hospital.entity.AdmittedPatient;
import com.emranhss.hospital.entity.BedBooking;
import com.emranhss.hospital.entity.Meal;
import com.emranhss.hospital.entity.MealMaster;
import com.emranhss.hospital.repository.IAdmittedPatientRepo;
import com.emranhss.hospital.repository.IBedBookingRepo;
import com.emranhss.hospital.repository.IMealMasterRepo;
import com.emranhss.hospital.repository.IMealRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class MealService {



    @Autowired
    private IMealRepo mealRepo;

    @Autowired
    private IMealMasterRepo mealMasterRepo;

    @Autowired
    private IBedBookingRepo bedBookingRepo;

    @Autowired
    private IAdmittedPatientRepo admittedPatientRepository;

    @Transactional
    public MealDTO assignMeals(MealDTO dto) {

        BedBooking bedBooking = bedBookingRepo.findById(dto.getBedBookingId())
                .orElseThrow(() -> new RuntimeException("BedBooking not found"));


        System.out.println("Bed Booking "+ bedBooking);

        List<Meal> savedMeals = new ArrayList<>();

        // Collect mealMasterIds
        List<Long> mealIds = new ArrayList<>();

        mealIds.addAll(dto.getMealIds());

        System.out.println("mealIds 444444444444444444444444444444444"+mealIds);

//        List<Long> mealIds = dto.getMealIds() != null ? dto.getMealIds() : new ArrayList<>();



//        if (dto.getMeals() != null && !dto.getMeals().isEmpty()) {
//            System.out.println("44444444444444444444444444444444444444444444444444444");
//            for (MealDTO m : dto.getMeals()) {
//                System.out.println("555555555555555555555555555555555555555555555555555");
//                if (m.getMealMasterId() != null) mealIds.add(m.getMealMasterId());
//            }
//        } else if (dto.getMealMasterId() != null) {
//            System.out.println("666666666666666666666666666666666666666666666");
//            mealIds.add(dto.getMealMasterId());
//        }

// === Eta loop er jaygay bosao ===
        for (Long mealId : mealIds) {
            System.out.println(mealId+"1000000000000000000000000000000000000");

            MealMaster master = mealMasterRepo.findById(mealId)
                    .orElseThrow(() -> new RuntimeException("MealMaster not found"));
            System.out.println(master+"2000000000000000000000000000000000000000000000");

            Meal meal = new Meal();
            meal.setBedBooking(bedBooking);
            meal.setMealMaster(master);
            meal.setMealCost(master.getPrice());
            meal.setServedAt(new Date());

            // Set admitted patient if exists
            if (dto.getAdmittedPatientId() != null) {
                AdmittedPatient patient = admittedPatientRepository.findById(dto.getAdmittedPatientId())
                        .orElseThrow(() -> new RuntimeException("AdmittedPatient not found"));
                meal.setAdmittedPatient(patient);
            }

            System.out.println("Meal 3333333333333333333333"+ meal );
            savedMeals.add(mealRepo.save(meal));
            System.out.println("Saved Meal 222222222222222222222222222222222222222"+ savedMeals.toString());
        }


        // Prepare response
        MealDTO result = new MealDTO();
        result.setPatientName(bedBooking.getPatientName());
        result.setAge(bedBooking.getAge());
        result.setPhone(bedBooking.getPhone());
        result.setAddress(bedBooking.getAddress());

        List<MealDTO> mealDTOList = new ArrayList<>();
        double total = 0;
        for (Meal m : savedMeals) {

            MealDTO mdto = new MealDTO();
            mdto.setMealId(m.getId());
            mdto.setMealName(m.getMealMaster().getName());
            mdto.setMealCategory(m.getMealMaster().getCategory());
            mdto.setMealType(m.getMealMaster().getType());
            mdto.setMealCost(m.getMealCost());
            mdto.setServedAt(m.getServedAt());

            mealDTOList.add(mdto);
            total += m.getMealCost();
        }

        result.setMeals(mealDTOList);
        result.setTotalCost(total);

        return result;
    }





    public MealDTO getMealsByBedBooking(Long bedBookingId) {
        List<Meal> meals = mealRepo.findByBedBookingId(bedBookingId);

        if(meals.isEmpty()) return null;

        MealDTO result = new MealDTO();
        List<MealDTO> mealDTOList = new ArrayList<>();
        double total = 0;

        BedBooking bedBooking = meals.get(0).getBedBooking();

        // Patient info
        result.setPatientName(bedBooking.getPatientName());
        result.setPhone(bedBooking.getPhone());
        result.setAge(bedBooking.getAge());
        result.setAddress(bedBooking.getAddress());

        for(Meal m : meals){
            MealDTO dto = new MealDTO();
            dto.setMealId(m.getId());
            dto.setMealName(m.getMealMaster().getName());
            dto.setMealCategory(m.getMealMaster().getCategory());
            dto.setMealType(m.getMealMaster().getType());
            dto.setMealCost(m.getMealCost());
            dto.setServedAt(m.getServedAt());
            mealDTOList.add(dto);

            total += m.getMealCost();
        }

        result.setMeals(mealDTOList);
        result.setTotalCost(total);

        return result;
    }


    public void deleteMeal(Long id) {
        mealRepo.deleteById(id);
    }
}
