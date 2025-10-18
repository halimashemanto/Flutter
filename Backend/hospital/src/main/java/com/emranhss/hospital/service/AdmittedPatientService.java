package com.emranhss.hospital.service;


import com.emranhss.hospital.dto.*;
import com.emranhss.hospital.entity.*;
import com.emranhss.hospital.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.concurrent.TimeUnit;
import java.util.Date;


@Service
public class AdmittedPatientService {


    @Autowired
    private IAdmittedPatientRepo admittedPatientRepository;

    @Autowired
    private IBedBookingRepo bedBookingRepository;

    @Autowired
    private IDoctorRepo doctorRepository;

    @Autowired
    private IDepartmentRepository departmentRepository;

    @Autowired
    private IWordRepo wardRepository;

    @Autowired
    private IBedRepo bedRepository;


}
