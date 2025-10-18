package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.MealDTO;
import com.emranhss.hospital.entity.BedBooking;
import com.emranhss.hospital.entity.Meal;
import com.emranhss.hospital.repository.IBedBookingRepo;
import com.emranhss.hospital.repository.IMealRepo;
import com.emranhss.hospital.service.MealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/meals")
public class MealRestController {

    @Autowired
    private MealService mealService;

    @Autowired
    private IBedBookingRepo  iBedBookingRepo;

    @Autowired
    private IMealRepo  iMealRepo;

    @PostMapping("")
    public MealDTO assignMealsToPatient(@RequestBody MealDTO dto){

        return mealService.assignMeals(dto);

    }

    @GetMapping("/bedbooking/{id}")
    public MealDTO getMealsByBedBooking(@PathVariable("id") Long bedBookingId) {
        List<Meal> meals = iMealRepo.findByBedBookingId(bedBookingId);
        if(meals == null) meals = new ArrayList<>();

        BedBooking bedBooking = iBedBookingRepo.findById(bedBookingId)
                .orElseThrow(() -> new RuntimeException("BedBooking not found"));

        MealDTO result = new MealDTO();
        result.setPatientName(bedBooking.getPatientName());
        result.setPhone(bedBooking.getPhone());
        result.setAge(bedBooking.getAge());
        result.setAddress(bedBooking.getAddress());

        List<MealDTO> mealDTOList = new ArrayList<>();
        double total = 0;

        for (Meal m : meals) {
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



    @DeleteMapping("/{id}")
    public void deleteMeal(@PathVariable Long id){
        mealService.deleteMeal(id);
    }
}
