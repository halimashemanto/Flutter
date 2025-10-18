package com.emranhss.hospital.restController;



import com.emranhss.hospital.dto.NurseDTO;
import com.emranhss.hospital.entity.Nurse;
import com.emranhss.hospital.entity.User;

import com.emranhss.hospital.repository.INurseRepo;
import com.emranhss.hospital.repository.IUserRepo;
import com.emranhss.hospital.service.AuthService;

import com.emranhss.hospital.service.NurseService;

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
@RequestMapping("/api/nurse/")
@CrossOrigin("*")
public class NurseRestController {

    @Autowired
    private AuthService authService;

    @Autowired
    private INurseRepo nurseRepository;

    @Autowired
    private IUserRepo userRepo;

    @Autowired
    private NurseService nurseService;

    @PostMapping("")
    public ResponseEntity<Map<String, String>> registerNurse(
            @RequestPart(value = "user") String userJson,
            @RequestPart(value = "nurse") String nurseJson,
            @RequestParam(value = "photo") MultipartFile file
    ) throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();
        User user = objectMapper.readValue(userJson, User.class);
        Nurse nurse = objectMapper.readValue(nurseJson, Nurse.class);

        try {
            authService.registerNurse(user, file, nurse);
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
    public ResponseEntity<List<Nurse>> getAllUsers() {
        List<Nurse> nurseList = nurseService.getAll();
        return ResponseEntity.ok(nurseList);

    }



// indivisual profile
    @GetMapping("nurseprofile")

    public ResponseEntity<NurseDTO> getNurseProfile(Authentication authentication) {

        String email = authentication.getName(); // logged-in user's email
        NurseDTO nurseDTO = nurseService.getNurseProfile(email);
        return ResponseEntity.ok(nurseDTO);

    }



    @GetMapping("profile")
    public ResponseEntity<?> getProfile(Authentication authentication) {
        System.out.println("Authenticated User: " + authentication.getName());
        System.out.println("Authorities: " + authentication.getAuthorities());
        String email = authentication.getName();
        Optional<User> user =userRepo.findByEmail(email);
        Nurse nurse = nurseService.getProfileByUserId(user.get().getId());
        return ResponseEntity.ok(nurse);

    }





}
