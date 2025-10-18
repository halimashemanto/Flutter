package com.emranhss.hospital.service;

import com.emranhss.hospital.dto.AuthenticationResponse;
import com.emranhss.hospital.entity.*;
import com.emranhss.hospital.jwt.JwtService;
import com.emranhss.hospital.repository.ITokenRepository;
import com.emranhss.hospital.repository.IUserRepo;
import jakarta.mail.MessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

@Service
public class UserService implements UserDetailsService {

    private final PasswordEncoder passwordEncoder;

    @Autowired
    private IUserRepo userRepo;

    @Autowired
    private EmailService emailService;

    @Autowired
    private DoctorService doctorService;


    @Autowired
    private JwtService jwtService;


    @Autowired
    private ITokenRepository tokenRepository;

    @Autowired
    @Lazy
    private AuthenticationManager authenticationManager;


    @Value("src/main/resources/static/images")
    private String uploadDir;

    public UserService(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepo.findByEmail(username)
                .orElseThrow(() -> new UsernameNotFoundException("User Not Found"));

        List<GrantedAuthority> authorities = Collections.singletonList(new SimpleGrantedAuthority(user.getRole().name()));

        return new org.springframework.security.core.userdetails.User(
                user.getEmail(),
                user.getPassword(),
                authorities
        );
    }

    public void saveOrUpdate(User user, MultipartFile imageFile) {
        if (imageFile != null && !imageFile.isEmpty()) {
            String filename = saveImage(imageFile, user);
            user.setPhoto(filename);
        }


        user.setRole(Role.Admin);
        userRepo.save(user);
        sendActivationEmail(user);
    }

    public List<User> findAll() {
        return userRepo.findAll();
    }

    public User findById(int id) {
        return userRepo.findById(id).get();
    }

    public void delete(User user) {
        userRepo.delete(user);
    }


    private void sendActivationEmail(User user) {
        String subject = "Welcome to Our Service – Confirm Your Registration";

        String activationLink = "http://localhost:8080/api/user/active/" + user.getId();

        String mailText = "<!DOCTYPE html>"
                + "<html>"
                + "<head>"
                + "<style>"
                + "  body { font-family: Arial, sans-serif; line-height: 1.6; }"
                + "  .container { max-width: 600px; margin: auto; padding: 20px; border: 1px solid #e0e0e0; border-radius: 10px; }"
                + "  .header { background-color: #4CAF50; color: white; padding: 10px; text-align: center; border-radius: 10px 10px 0 0; }"
                + "  .content { padding: 20px; }"
                + "  .footer { font-size: 0.9em; color: #777; margin-top: 20px; text-align: center; }"
                + "</style>"
                + "</head>"
                + "<body>"
                + "  <div class='container'>"
                + "    <div class='header'>"
                + "      <h2>Welcome to Our Platform</h2>"
                + "    </div>"
                + "    <div class='content'>"
                + "      <p>Dear " + user.getName() + ",</p>"
                + "      <p>Thank you for registering with us. We are excited to have you on board!</p>"
                + "      <p>Please confirm your email address to activate your account and get started.</p>"
                + "      <p>If you have any questions or need help, feel free to reach out to our support team.</p>"
                + "      <br>"
                + "      <p>Best regards,<br>The Support Team</p>"
                + "      <p>To Activate Your Account, please click the following link:</p>"
                + "      <p><a href=\"" + activationLink + "\">Activate Account</a></p>"
                + "    </div>"
                + "    <div class='footer'>"
                + "      &copy; " + java.time.Year.now() + " YourCompany. All rights reserved."
                + "    </div>"
                + "  </div>"
                + "</body>"
                + "</html>";

        try {
            emailService.sendSimpleEmail(user.getEmail(), subject, mailText);
        } catch (MessagingException e) {
            throw new RuntimeException("Failed to send activation email", e);
        }
    }


    // for User folder
    public String saveImage(MultipartFile file, User user) {

        Path uploadPath = Paths.get(uploadDir + "/users");
        if (!Files.exists(uploadPath)) {
            try {
                Files.createDirectory(uploadPath);

            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

        String fileName = user.getName() + "_" + UUID.randomUUID().toString();


        try {
            Path filePath = uploadPath.resolve(fileName);
            Files.copy(file.getInputStream(), filePath);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return fileName;

    }

    // for doctor folder
    public String saveImageForDoctor(MultipartFile file, Doctor doctor) {

        Path uploadPath = Paths.get(uploadDir + "/doctor");
        if (!Files.exists(uploadPath)) {
            try {
                Files.createDirectory(uploadPath);

            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

        String doctorName = doctor.getName();
        String fileName = doctorName.trim().replaceAll("\\s+", "_");

        String savedFileName = fileName + "_" + UUID.randomUUID().toString();

        try {
            Path filePath = uploadPath.resolve(savedFileName);
            Files.copy(file.getInputStream(), filePath);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return savedFileName;

    }


    public void registerDoctor(User user, MultipartFile imageFile, Doctor doctorData) {
        if (imageFile != null && !imageFile.isEmpty()) {
            // Save image for both User and doctor
            String filename = saveImage(imageFile, user);
            String doctorPhoto = saveImageForDoctor(imageFile, doctorData);
            doctorData.setPhoto(doctorPhoto);
            user.setPhoto(filename);
        }

        // Encode password before saving User
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(Role.Doctor);
        user.setActive(false);

        // Save User FIRST and get persisted instance
        User savedUser = userRepo.save(user);

        // Now, associate saved User with doctor and save doctor
        doctorData.setUser(savedUser);
//        doctorService.save(doctorData);

        // Now generate token and save Token associated with savedUser
        String jwt = jwtService.generateToken(savedUser);
        saveUserToken(jwt, savedUser);

        // Send Activation Email
        sendActivationEmail(savedUser);
    }


    private void saveUserToken(String jwt, User user) {
        Token token = new Token();
        token.setToken(jwt);
        token.setLogout(false);
        token.setUser(user);

        tokenRepository.save(token);

    }

    private void removeAllTokenByUser(User user) {

        List<Token> validTokens = tokenRepository.findAllTokenByUser(user.getId());

        if (validTokens.isEmpty()) {
            return;
        }
        validTokens.forEach(t -> {
            t.setLogout(true);
        });

        tokenRepository.saveAll(validTokens);

    }


    // It is Login Method
    public AuthenticationResponse authencate(User request) {

        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getUsername(),
                        request.getPassword()
                )
        );

        User user = userRepo.findByEmail(request.getEmail()).orElseThrow();

        if (!user.isActive()) {
            throw new RuntimeException("Account is not activated. Please check your email for activation link.");
        }

        // Generate Token for Current User
        String jwt = jwtService.generateToken(user);

        //Remove all existing toke for this user
        removeAllTokenByUser(user);

        saveUserToken(jwt, user);

        return new AuthenticationResponse(jwt, "User Login Successful");

    }


    public String activeUser(int id) {

        User user = userRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("User not Found with this ID " + id));

        if (user != null) {
            user.setActive(true);

            userRepo.save(user);
            return "User Activated Successfully!";

        } else {
            return "Invalid Activation Token!";
        }

    }




    public List<User> getUsersByRole(String role) {
        return userRepo.findByRole(Role.valueOf(role));
    }












}
