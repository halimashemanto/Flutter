package com.emranhss.hospital.service;


import com.emranhss.hospital.dto.MealMasterDTO;
import com.emranhss.hospital.entity.MealMaster;
import com.emranhss.hospital.repository.IMealMasterRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class MealMasterService {

    @Autowired
    private IMealMasterRepo mealMasterRepository;



    public MealMasterDTO saveMealMaster(MealMasterDTO dto) {
        MealMaster mealMaster = new MealMaster(
                dto.getId(),
                dto.getCategory(),
                dto.getType(),
                dto.getName(),
                dto.getDetails(),
                dto.getPrice()
        );
        MealMaster saved = mealMasterRepository.save(mealMaster);
        return convertToDTO(saved);
    }


    public MealMasterDTO updateMealMaster(Long id, MealMasterDTO dto) {
        MealMaster mealMaster = mealMasterRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("MealMaster not found"));

        mealMaster.setCategory(dto.getCategory());
        mealMaster.setType(dto.getType());
        mealMaster.setName(dto.getName());
        mealMaster.setDetails(dto.getDetails());
        mealMaster.setPrice(dto.getPrice());

        MealMaster updated = mealMasterRepository.save(mealMaster);
        return convertToDTO(updated);
    }


    public void deleteMealMaster(Long id) {
        mealMasterRepository.deleteById(id);
    }


    public List<MealMasterDTO> getAllMealMasters() {
        return mealMasterRepository.findAll()
                .stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }


    public MealMasterDTO getMealMasterById(Long id) {
        MealMaster mealMaster = mealMasterRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("MealMaster not found"));
        return convertToDTO(mealMaster);
    }

    // DTO Convert
    private MealMasterDTO convertToDTO(MealMaster mealMaster) {
        return new MealMasterDTO(
                mealMaster.getId(),
                mealMaster.getCategory(),
                mealMaster.getType(),
                mealMaster.getName(),
                mealMaster.getDetails(),
                mealMaster.getPrice()
        );
    }
}
