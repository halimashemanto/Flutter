package com.emranhss.hospital.service;


import com.emranhss.hospital.dto.AuthenticationResponse;
import com.emranhss.hospital.entity.*;
import com.emranhss.hospital.jwt.JwtService;
import com.emranhss.hospital.repository.IDepartmentRepository;
import com.emranhss.hospital.repository.ITokenRepository;
import com.emranhss.hospital.repository.IUserRepo;
import jakarta.mail.MessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

@Service
public class AuthService {
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private IUserRepo userRepo;
    @Autowired
    private ITokenRepository tokenRepository;

    @Autowired
    private IDepartmentRepository  departmentRepository;

    @Autowired
    private EmailService emailService;

    @Autowired
    private DoctorService doctorService;

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private ScheduleSlotService scheduleSlotService;

    @Autowired
    private NurseService nurseService;


    @Autowired
    private OfficeStaffService officeStaffService;


    @Autowired
    private ReceptionistService receptionistService;


    @Autowired
    private JwtService jwtService;


    @Autowired
    @Lazy
    private AuthenticationManager authenticationManager;


    @Value("src/main/resources/static/images")
    private String uploadDir;



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

//        String activationLink="http://localhost:8080/api/user/active/"+user.getId();

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
//                + "      <p><a href=\"" + activationLink + "\">Activate Account</a></p>"
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







                                                                //    doctor part start


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

        // 1️⃣ Image save (User + Doctor)
        if (imageFile != null && !imageFile.isEmpty()) {
            String filename = saveImage(imageFile, user);
            String doctorPhoto = saveImageForDoctor(imageFile, doctorData);
            doctorData.setPhoto(doctorPhoto);
            user.setPhoto(filename);
        }

        Department department = departmentRepository.findById(
                doctorData.getDepartment().getId()
        ).orElseThrow(() -> new RuntimeException("Department Not Found"));


        doctorData.setDepartment(department);


        // 2️⃣ Password encode + role + active
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(Role.Doctor);
        user.setActive(true);

        // 3️⃣ Save User
        User savedUser = userRepo.save(user);



        // 5️⃣ Associate saved User
        doctorData.setUser(savedUser);

        // 6️⃣ Save Doctor
        doctorService.save(doctorData);

        // 7️⃣ Generate Token & save
        String jwt = jwtService.generateToken(savedUser);
        saveUserToken(jwt, savedUser);

        // 8️⃣ Send Activation Email
        sendActivationEmail(savedUser);
    }
                                                                //    doctor part End




                                //    Nurse Part Start


    //  nurse Images folder
    public String saveImageForNurse(MultipartFile file, Nurse nurse) {

        Path uploadPath = Paths.get(uploadDir + "nurse");
        if (!Files.exists(uploadPath)) {
            try {
                Files.createDirectory(uploadPath);

            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

        String nurseName = nurse.getName() ;
        String fileName = nurseName.trim().replaceAll("\\s+", "_") ;

        String savedFileName = fileName+ "_" + UUID.randomUUID().toString();

        try {
            Path filePath = uploadPath.resolve(savedFileName);
            Files.copy(file.getInputStream(), filePath);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return savedFileName;

    }
//Nurse Configuration

    public void registerNurse(User user, MultipartFile imageFile, Nurse nurseData)  {
        if (imageFile != null && !imageFile.isEmpty()) {
            // Save image for both User and nurse
            String filename = saveImage(imageFile, user);
            String nursePhoto = saveImageForNurse(imageFile,nurseData);
            nurseData.setPhoto(nursePhoto);
            user.setPhoto(filename);
        }


        // Encode password before saving User
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(Role.Nurse);
        user.setActive(true);


        // Save User FIRST and get persisted instance
        User savedUser = userRepo.save(user);

        // Set user to nurse and save it
        nurseData.setUser(savedUser);
        nurseService.save(nurseData);

        // Now generate token and save Token associated with savedUser
        String jwt = jwtService.generateToken(savedUser);
        saveUserToken(jwt, savedUser);

        // Send Activation Email
        sendActivationEmail(savedUser);
    }



                                                 //    Nurse Part Start



                                 //  OFFICE-STAFF PART START

    //  Office Staff Images folder
    public String saveImageForOfficeStaff(MultipartFile file, OfficeStaff officeStaff) {

        Path uploadPath = Paths.get(uploadDir + "officeStaff");
        if (!Files.exists(uploadPath)) {
            try {
                Files.createDirectory(uploadPath);

            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

        String officeStaffName = officeStaff.getName() ;
        String fileName = officeStaffName.trim().replaceAll("\\s+", "_") ;

        String savedFileName = fileName+ "_" + UUID.randomUUID().toString();

        try {
            Path filePath = uploadPath.resolve(savedFileName);
            Files.copy(file.getInputStream(), filePath);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return savedFileName;

    }
//Office Staff Configuration

    public void registerOfficeStaff(User user, MultipartFile imageFile, OfficeStaff officeStaffData) {
        if (imageFile != null && !imageFile.isEmpty()) {
            // Save image for both User and officeStaff
            String filename = saveImage(imageFile, user);
            String officeStaffPhoto = saveImageForOfficeStaff(imageFile, officeStaffData);
            officeStaffData.setPhoto(officeStaffPhoto);
            user.setPhoto(filename);
        }


        // Encode password before saving User
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(Role.OfficeStaff);
        user.setActive(true);

        // Save User FIRST and get persisted instance
        User savedUser = userRepo.save(user);

        // Set user to OfficeStaff and save it
        officeStaffData.setUser(savedUser);
        officeStaffService.save(officeStaffData);

        // Now generate token and save Token associated with savedUser
        String jwt = jwtService.generateToken(savedUser);
        saveUserToken(jwt, savedUser);

        // Send Activation Email
        sendActivationEmail(savedUser);


    }

                                                        //    OFFICE-STAFF PART END



                       //    Receptionist PART start


    // for receptionist folder
    public String saveImageForReceptionist(MultipartFile file, Receptionist receptionist) {

        Path uploadPath = Paths.get(uploadDir + "/receptionist");
        if (!Files.exists(uploadPath)) {
            try {
                Files.createDirectory(uploadPath);

            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

        String receptionistName = receptionist.getName();
        String fileName = receptionistName.trim().replaceAll("\\s+", "_");

        String savedFileName = fileName + "_" + UUID.randomUUID().toString();

        try {
            Path filePath = uploadPath.resolve(savedFileName);
            Files.copy(file.getInputStream(), filePath);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return savedFileName;

    }


    public void registerReceptionist(User user, MultipartFile imageFile, Receptionist receptionistData) {
        if (imageFile != null && !imageFile.isEmpty()) {


            // Save image for both User and doctor
            String filename = saveImage(imageFile, user);
            String receptionistPhoto = saveImageForReceptionist(imageFile, receptionistData);
            receptionistData.setPhoto(receptionistPhoto);
            user.setPhoto(filename);
        }


        // Encode password before saving User
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(Role.Receptionist);
        user.setActive(true);

        // Save User FIRST and get persisted instance
        User savedUser = userRepo.save(user);

        // Now, associate saved User with receptionist and save receptionist
        receptionistData.setUser(savedUser);
        receptionistService.save(receptionistData);

        // Now generate token and save Token associated with savedUser
        String jwt = jwtService.generateToken(savedUser);
        saveUserToken(jwt, savedUser);

        // Send Activation Email
        sendActivationEmail(savedUser);
    }


                                                        //    Receptionist PART END



//token saved

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
    public AuthenticationResponse authenticate(User request) {
        // Authenticate Username & Password
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getUsername(),
                        request.getPassword()
                )
        );

        // Fetch User from DB
        User user = userRepo.findByEmail(request.getEmail())
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));



       // ==================eta apatoto off kore rakchi mail active korar jamela hoy tai =========



        // Check Activation Status
//        if (!user.isActive()) {
//            throw new RuntimeException("Account is not activated. Please check your email for activation link.");
//        }

        // Generate JWT Token
        String jwt = jwtService.generateToken(user);

        // Remove Existing Tokens (Invalidate Old Sessions)
        removeAllTokenByUser(user);

        // Save New Token to DB (Optional if stateless)
        saveUserToken(jwt, user);

        // Return Authentication Response
        return new AuthenticationResponse(jwt, "User Login Successful");
    }



    public  String activeUser(int id){

        User user=userRepo.findById(id)
                .orElseThrow(()-> new RuntimeException("User not Found with this ID "+id));

        if(user !=null){
            user.setActive(true);

            userRepo.save(user);
            return "User Activated Successfully!";

        }else {
            return  "Invalid Activation Token!";
        }

    }










    // ✅ Admin Registration Method
    public void registerAdmin(User user, MultipartFile imageFile) {
        if (imageFile != null && !imageFile.isEmpty()) {
            // User এর জন্য image save করব
            String filename = saveImage(imageFile, user);
            user.setPhoto(filename);
        }

        // Password Encode + Role Set + Active
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(Role.Admin);
        user.setActive(true);

        // Save User
        User savedUser = userRepo.save(user);

        // JWT Token Generate + Save
        String jwt = jwtService.generateToken(savedUser);
        saveUserToken(jwt, savedUser);

        // Activation Mail পাঠানো
        sendActivationEmail(savedUser);
    }























}
