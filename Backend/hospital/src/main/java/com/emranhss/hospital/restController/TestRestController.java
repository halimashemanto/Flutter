package com.emranhss.hospital.restController;

import com.emranhss.hospital.dto.TestDTO;
import com.emranhss.hospital.entity.Tests;
import com.emranhss.hospital.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/tests/")
public class TestRestController {

    @Autowired
    private TestService testService;

    @PostMapping("")
    public void save(@RequestBody Tests ts) {
        testService.save(ts);
    }

    @GetMapping("")
    public List<TestDTO> getAll() {

        return testService.getAllTestsDTO();
    }

    @GetMapping("{id}")
    public Tests getById(@PathVariable Long id) {

        return testService.getById(id).get();
    }

    @DeleteMapping("/{id}")
    public void deleteById(@PathVariable Long id) {

        testService.delete(id);
    }

    @PutMapping("/{id}")
    public void Update(@RequestBody Tests ts) {

        testService.save(ts);

    }

}
