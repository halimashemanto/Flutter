package com.emranhss.hospital.service;


import com.emranhss.hospital.entity.TestMaster;
import com.emranhss.hospital.repository.ITestMasterRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestMasterService {


    @Autowired
    private ITestMasterRepo testMasterRepo;


    public TestMaster addTest(TestMaster test) {
        return testMasterRepo.save(test);
    }


    public List<TestMaster> getAllTests() {
        return testMasterRepo.findAll();
    }


    public TestMaster updateTest(Long id, TestMaster testDetails) {
        TestMaster test = testMasterRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Test not found"));
        test.setTestName(testDetails.getTestName());
        test.setTestPrice(testDetails.getTestPrice());
        return testMasterRepo.save(test);
    }


    public void deleteTest(Long id) {
        testMasterRepo.deleteById(id);
    }


    public TestMaster getTestById(Long id) {
        return testMasterRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Test not found"));
    }
}
