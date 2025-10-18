package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.AuthenticationResponse;
import com.emranhss.hospital.entity.User;
import com.emranhss.hospital.repository.ITokenRepository;
import com.emranhss.hospital.repository.IUserRepo;
import com.emranhss.hospital.service.AuthService;
import com.emranhss.hospital.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/auth/")
public class AuthRestController {

    @Autowired
    private AuthService authService;

    @Autowired
    ITokenRepository tokenRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private IUserRepo userRepo;


    @PostMapping
    public ResponseEntity<Map<String, String>> saveUser(
            @RequestPart(value = "user") String userJson,
            @RequestParam(value = "photo") MultipartFile file
    ) throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();
        User user = objectMapper.readValue(userJson, User.class);

        try {
            authService.saveOrUpdate(user, file);
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
    public ResponseEntity<List<User>> getAllUsers() {
        List<User> users = authService.findAll();
        return ResponseEntity.ok(users);

    }


    @PostMapping("login")
    public ResponseEntity<AuthenticationResponse>  login(@RequestBody User request){
        return ResponseEntity.ok(authService.authenticate(request));

    }


    @GetMapping("/active/{id}")
    public ResponseEntity<String> activeUser(@PathVariable("id") int id){

        String response= authService.activeUser(id);
        return  ResponseEntity.ok(response);
    }


    @PostMapping("/logout")
    public ResponseEntity<String> logout(HttpServletRequest request) {
        final String authHeader = request.getHeader("Authorization");

        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            return ResponseEntity.badRequest().body("Missing or invalid Authorization header.");
        }

        String token = authHeader.substring(7);  // Strip "Bearer "

        tokenRepository.findByToken(token).ifPresent(savedToken -> {
            savedToken.setLogout(true);  // Mark token as logged out
            tokenRepository.save(savedToken);
        });

        return ResponseEntity.ok("Logged out successfully.");
    }







//admin part include here bcz admin hasn't any component


    @PostMapping("register/admin")
    public ResponseEntity<String> registerAdmin(
            @RequestPart("user") User user,
            @RequestPart(value = "imageFile", required = false) MultipartFile imageFile) {
        authService.registerAdmin(user, imageFile);
        return ResponseEntity.ok("Admin Registered Successfully!");
    }


    @GetMapping("user/role/{role}") //http://localhost:8080/auth/user/role/Admin
    public ResponseEntity<List<User>> getUsersByRole(@PathVariable String role) {
        List<User> users = userService.getUsersByRole(role);
        return ResponseEntity.ok(users);
    }



    @GetMapping("user/profile")
    public User getProfile(Authentication authentication) {
        String email = authentication.getName(); // JWT theke logged-in user email
        return userRepo.findByEmail(email)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "User not found"));
    }










}
