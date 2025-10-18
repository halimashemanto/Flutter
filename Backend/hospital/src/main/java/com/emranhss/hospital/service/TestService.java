package com.emranhss.hospital.service;

import com.emranhss.hospital.dto.TestDTO;
import com.emranhss.hospital.entity.Tests;
import com.emranhss.hospital.repository.ITestRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class TestService {

    @Autowired
    private ITestRepo testRepo;


    public List<TestDTO> getAllTestsDTO() {
        return testRepo.findAll().stream()
                .map(t -> new TestDTO(
                        t.getId(),
                        t.getTestName(),
                        t.getTestPrice(),
                        t.getInvoice() != null ? t.getInvoice().getId() : null
                ))
                .collect(Collectors.toList());
    }


    public Tests save(Tests tests) {

        return testRepo.save(tests);
    }


    public Optional<Tests> getById(Long id) {

        return testRepo.findById(id);
    }

    public Tests findById(long id){
        return testRepo.findById(id)
                .orElseThrow(()->new RuntimeException("Tests Not Found with id"+id));
    }


    public void delete(long id) {
        testRepo.deleteById(id);
    }


}
