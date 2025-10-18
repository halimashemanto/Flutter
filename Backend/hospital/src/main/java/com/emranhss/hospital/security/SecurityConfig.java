package com.emranhss.hospital.security;

import com.emranhss.hospital.jwt.JwtAuthenticationFilter;
import com.emranhss.hospital.jwt.JwtService;
import com.emranhss.hospital.service.UserService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import java.util.List;

@Configuration
@EnableWebSecurity
public class SecurityConfig {



    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http,
                                           JwtAuthenticationFilter jwtAuthenticationFilter,
                                           UserService userService) throws Exception {

        return http
                .csrf(AbstractHttpConfigurer::disable)
                .cors(Customizer.withDefaults())
                .authorizeHttpRequests(req ->

                        req.requestMatchers("/api/user/",
                                        "/auth/user/role/**",
                                        "/auth/user/profile",
                                        "/images/**",
                                        "/imagesnurse/**",
                                        "/imagesofficeStaff/**",
                                        "/auth/all",
                                        "/auth/**",
                                        "/api/doctor/**",
                                        "/api/doctor/",
                                        "/api/user/active/**",
                                        "/auth/login",
                                        "/api/nurse/**",
                                        "/api/receptionist/**",
                                        "/api/officeStaff/**",
                                        "/api/tests/**",
                                        "/api/medicine/**",
                                        "/api/department/**",
                                        "/api/department/",
                                        "/api/slot/**",
                                        "/api/slot",
                                        "/api/prescription",
                                        "/api/prescription/**",
                                        "/api/patient/",
                                        "/api/invoice",
                                        "/api/invoice/**",
                                        "/api/report",
                                        "/api/report/**",
                                        "/api/appoinment",
                                        "/api/appoinment/**",
                                        "/api/patient/**",
                                        "/api/doctor/by-department/**",
                                        "/api/slot/doctor/**",
                                        "/api/emergency",
                                        "/api/emergency/**",
                                        "/api/ward",
                                        "/api/ward/**",
                                        "/api/admittedPatient",
                                        "/api/admittedPatient/**",
                                        "/api/testss",
                                        "/api/testss/**",
                                        "/api/medicines",
                                        "/api/medicines/**",
                                        "/api/stocks",
                                        "/api/stocks/**",
                                        "/api/suppliers",
                                        "/api/suppliers/**",
                                        "/api/purchases",
                                        "/api/purchases/**",
                                        "/api/sales",
                                        "/api/sales/**",
                                        "/api/test-master",
                                        "/api/test-master/**",
                                        "/api/patient-tests",
                                        "/api/patient-tests/**",
                                        "/api/meal-masters",
                                        "/api/meal-masters/**",
                                        "/api/meals",
                                        "/api/meals/**",
                                        "/api/doctor-charges",
                                        "/api/doctor-charges/**",
                                        "/api/nurse/nurseprofile",
                                        "/api/officeStaff/officestaffprofile",
                                        "/api/receptionist/receptionistprofile",
                                        "/api/others-charges",
                                        "/api/others-charges/**",
                                        "/api/medicine-admitted",
                                        "/api/medicine-admitted/**",
                                        "/api/billing",
                                        "/api/billing/**",
                                        "/api/discharge",
                                        "/api/discharge/**"


                                        )

                                .permitAll()
                                .requestMatchers("/api/doctor/profile","/api/nurse/profile","/api/receptionist/profile")
                                .hasAnyRole("Doctor","Nurse","Admin","Receptionist","OfficeStaff")
                                .anyRequest().authenticated()
                )
                .userDetailsService(userService)
                .sessionManagement(session ->
                        session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                )
                .addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class)
                .build();
    }

    @Bean
    public JwtAuthenticationFilter jwtAuthenticationFilter(JwtService jwtService, UserService userService) {
        return new JwtAuthenticationFilter(jwtService, userService);
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }

    @Bean
    public PasswordEncoder encoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {

        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(List.of("http://localhost:4200", "http://127.0.0.1:4200","http://localhost:5000"));
        configuration.setAllowedMethods(List.of("GET", "POST", "DELETE", "PUT", "OPTIONS"));
        configuration.setAllowedHeaders(List.of("Authorization", "Cache_Control", "Content-type"));
        configuration.setAllowCredentials(true);

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

}
