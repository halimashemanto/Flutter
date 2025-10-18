package com.emranhss.hospital.restController;


import com.emranhss.hospital.entity.TestMaster;
import com.emranhss.hospital.service.TestMasterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/test-master")
public class TestMasterRestController {


    @Autowired
    private TestMasterService testMasterService;

    // 🔹 Add new test
    @PostMapping
    public TestMaster addTest(@RequestBody TestMaster test) {
        return testMasterService.addTest(test);
    }

    // 🔹 Get all tests
    @GetMapping
    public List<TestMaster> getAllTests() {
        return testMasterService.getAllTests();
    }

    // 🔹 Get test by id
    @GetMapping("/{id}")
    public TestMaster getTestById(@PathVariable Long id) {
        return testMasterService.getTestById(id);
    }

    // 🔹 Update test
    @PutMapping("/{id}")
    public TestMaster updateTest(@PathVariable Long id, @RequestBody TestMaster test) {
        return testMasterService.updateTest(id, test);
    }

    // 🔹 Delete test
    @DeleteMapping("/{id}")
    public void deleteTest(@PathVariable Long id) {
        testMasterService.deleteTest(id);
    }
}
