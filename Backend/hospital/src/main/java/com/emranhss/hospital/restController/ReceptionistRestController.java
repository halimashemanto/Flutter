package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.OfficeStaffDTO;
import com.emranhss.hospital.dto.ReceptionistDTO;
import com.emranhss.hospital.entity.Doctor;
import com.emranhss.hospital.entity.OfficeStaff;
import com.emranhss.hospital.entity.Receptionist;
import com.emranhss.hospital.entity.User;
import com.emranhss.hospital.repository.IUserRepo;
import com.emranhss.hospital.service.AuthService;
import com.emranhss.hospital.service.ReceptionistService;
import com.emranhss.hospital.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/receptionist/")
@CrossOrigin("*")

public class ReceptionistRestController {

    @Autowired
    private AuthService authService;
    @Autowired
    private ReceptionistService receptionistService;

    @Autowired
    private IUserRepo userRepo;

    @PostMapping("")
    public ResponseEntity<Map<String, String>> registerReceptionist(
            @RequestPart(value = "user") String userJson,
            @RequestPart(value = "receptionist") String receptionistJson,
            @RequestParam(value = "photo") MultipartFile file
    ) throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();
        User user = objectMapper.readValue(userJson, User.class);
        Receptionist receptionist = objectMapper.readValue(receptionistJson, Receptionist.class);

        try {
           authService.registerReceptionist(user, file, receptionist);
            Map<String, String> response = new HashMap<>();
            response.put("Message", "User Added Successfully ");

            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (Exception e) {

            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("Message", "User Add Faild " + e);
            return new ResponseEntity<>(errorResponse, HttpStatus.INTERNAL_SERVER_ERROR);
        }


    }










    @GetMapping("all")
    public ResponseEntity<List<Receptionist>> getAllUsers() {
        List<Receptionist> nurseList = receptionistService.getAll();
        return ResponseEntity.ok(nurseList);

    }


    @GetMapping("profile")
    public ResponseEntity<?> getProfile(Authentication authentication) {
        System.out.println("Authenticated User: " + authentication.getName());
        System.out.println("Authorities: " + authentication.getAuthorities());
        String email = authentication.getName();
        Optional<User> user =userRepo.findByEmail(email);
        Receptionist receptionist = receptionistService.getProfileByUserId(user.get().getId());
        return ResponseEntity.ok(receptionist);

    }



    @GetMapping("receptionistprofile")

    public ResponseEntity<ReceptionistDTO> getReceptionistProfile(Authentication authentication) {

        String email = authentication.getName();
        ReceptionistDTO receptionistDTO = receptionistService.getReceptionistProfile(email);
        return ResponseEntity.ok(receptionistDTO);

    }
























}
