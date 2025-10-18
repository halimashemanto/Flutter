package com.emranhss.hospital.restController;

import com.emranhss.hospital.dto.AppoinmentDTO;
import com.emranhss.hospital.entity.Appoinment;
import com.emranhss.hospital.repository.IAppoinmentRepo;
import com.emranhss.hospital.service.AppoinmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/appoinment")
public class AppoinmentRestController {

    @Autowired
    private AppoinmentService appointmentService;

    @Autowired
    private IAppoinmentRepo appoinmentRepo;



    @PostMapping
    public ResponseEntity<Appoinment> bookAppointment(@RequestBody Appoinment appointment) {

        System.out.println(appointment+ "333333333333333333333333333");
        Appoinment saved = appointmentService.bookAppointment(appointment);
        return ResponseEntity.ok(saved);
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<String> cancelAppointment(@PathVariable Long id) {
        appointmentService.cancelAppointment(id);
        return ResponseEntity.ok("Appointment cancelled and slot freed up");
    }


    @GetMapping
    public ResponseEntity<List<AppoinmentDTO>> getAllAppointments() {
        return ResponseEntity.ok(appointmentService.getAllAppointments());
    }


    @GetMapping("/{id}")
    public AppoinmentDTO getAppoinmentById(@PathVariable Long id) {
        return appointmentService.getAppoinmentById(id);
    }

//    {
//        "id": 1,
//            "patientName": "Atiqul Islam",
//            "patientContact": "01236547899",
//            "reason": "Headache",
//            "doctorId": 3,
//            "doctorName": "Prof. Imran Mia",
//            "departmentId": 5,
//            "departmentName": "Neurology",
//            "scheduleSlotId": 12,
//            "slotDate": "2025-09-01T00:00:00.000+00:00",
//            "slotStartTime": "18:45",
//            "slotEndTime": "19:00"
//    }








}
