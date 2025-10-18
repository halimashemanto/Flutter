package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.MealMasterDTO;
import com.emranhss.hospital.service.MealMasterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/meal-masters")
public class MealMasterController {

    @Autowired
    private MealMasterService mealMasterService;

    @PostMapping
    public MealMasterDTO createMealMaster(@RequestBody MealMasterDTO dto) {
        return mealMasterService.saveMealMaster(dto);
    }

    @PutMapping("/{id}")
    public MealMasterDTO updateMealMaster(@PathVariable Long id, @RequestBody MealMasterDTO dto) {
        return mealMasterService.updateMealMaster(id, dto);
    }

    @DeleteMapping("/{id}")
    public String deleteMealMaster(@PathVariable Long id) {
        mealMasterService.deleteMealMaster(id);
        return "MealMaster deleted successfully";
    }

    @GetMapping
    public List<MealMasterDTO> getAllMealMasters() {
        return mealMasterService.getAllMealMasters();
    }

    // Get By ID
    @GetMapping("/{id}")
    public MealMasterDTO getMealMasterById(@PathVariable Long id) {
        return mealMasterService.getMealMasterById(id);
    }

}
