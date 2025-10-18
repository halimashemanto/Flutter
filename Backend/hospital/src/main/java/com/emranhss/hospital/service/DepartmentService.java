package com.emranhss.hospital.service;


import com.emranhss.hospital.dto.DepartmentResponseDTO;
import com.emranhss.hospital.entity.Department;
import com.emranhss.hospital.entity.Tests;
import com.emranhss.hospital.repository.IDepartmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class DepartmentService {

    @Autowired
    private IDepartmentRepository departmentRepo;

//    public List<Department> getAllDepartment() {
//
//        return departmentRepo.findAll();
//    }
//
//
//    public Department save(Department department) {
//        return departmentRepo.save(department);
//    }
//
//
//    public Optional<Department> getById(Long id) {
//        return departmentRepo.findById(id);
//    }
//
//
//    public Department findById(long id){
//        return departmentRepo.findById(id).orElseThrow(()->new RuntimeException("Tests Not Found with id"+id));
//    }
//
//
//    public void delete(long id) {
//        departmentRepo.deleteById(id);
//    }
//


    private DepartmentResponseDTO convertToDTO(Department department) {
        return new DepartmentResponseDTO(
                department.getId(),
                department.getDepartmentName(),
                department.getDescription()
        );
    }


    public List<DepartmentResponseDTO> getAllDepartments() {
        return departmentRepo.findAll()
                .stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }


    public DepartmentResponseDTO save(Department department) {
        Department saved = departmentRepo.save(department);
        return convertToDTO(saved);
    }


    public Optional<DepartmentResponseDTO> getById(Long id) {
        return departmentRepo.findById(id).map(this::convertToDTO);
    }


    public DepartmentResponseDTO findById(long id) {
        Department department = departmentRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Department Not Found with id " + id));
        return convertToDTO(department);
    }


    public void delete(long id) {
        departmentRepo.deleteById(id);
    }


}
