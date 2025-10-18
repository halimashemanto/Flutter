package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.DepartmentResponseDTO;
import com.emranhss.hospital.entity.Department;
import com.emranhss.hospital.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/department/")
public class DepartmentRestController {


    @Autowired
    private DepartmentService departmentService;

    @GetMapping
    public ResponseEntity<List<DepartmentResponseDTO>> getAllDepartments() {
        return ResponseEntity.ok(departmentService.getAllDepartments());
    }

    @GetMapping("/{id}")
    public ResponseEntity<DepartmentResponseDTO> getDepartmentById(@PathVariable Long id) {
        return departmentService.getById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<DepartmentResponseDTO> createDepartment(@RequestBody Department department) {
        return ResponseEntity.ok(departmentService.save(department));
    }


//    @PostMapping("")
//    public void save(@RequestBody Department department) {
//        departmentService.save(department);
//    }
//
//    @GetMapping("")
//    public List<Department> getAll() {
//
//        return departmentService.getAllDepartment();
//    }
//
//    @GetMapping("{id}")
//    public Department getById(@PathVariable Long id) {
//
//        return departmentService.getById(id).get();
//    }

    @DeleteMapping("/{id}")
    public void deleteById(@PathVariable Long id) {

        departmentService.delete(id);
    }

    @PutMapping("/{id}")
    public void Update(@RequestBody Department department) {

        departmentService.save(department);

    }

//    @GetMapping("")
//    public List<Department> getAllDepartments() {
//        return departmentService.getAllDepartment();
//    }


}
