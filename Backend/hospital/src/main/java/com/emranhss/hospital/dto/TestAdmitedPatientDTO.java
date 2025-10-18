package com.emranhss.hospital.dto;

import java.util.Date;
import java.util.List;

public class TestAdmitedPatientDTO {



        private Long id;
        private Long bedBookingId;


        private String patientName;
        private int age;
        private String phone;
        private String address;

        private List<Long> testIds; // selected test IDs
        private double testCost; // subtotal

        private List<TestInfoDTO> selectedTests;

        public static class TestInfoDTO {
            private Long id;
            private String testName;
            private double testPrice;

            public TestInfoDTO() {}
            public TestInfoDTO(Long id, String testName, double testPrice) {
                this.id = id;
                this.testName = testName;
                this.testPrice = testPrice;
            }

            // getters & setters
            public Long getId() { return id; }
            public void setId(Long id) { this.id = id; }

            public String getTestName() { return testName; }
            public void setTestName(String testName) { this.testName = testName; }

            public double getTestPrice() { return testPrice; }
            public void setTestPrice(double testPrice) { this.testPrice = testPrice; }
        }

        // getters & setters
        public Long getId() { return id; }
        public void setId(Long id) { this.id = id; }

        public Long getBedBookingId() { return bedBookingId; }
        public void setBedBookingId(Long bedBookingId) { this.bedBookingId = bedBookingId; }



        public String getPatientName() { return patientName; }
        public void setPatientName(String patientName) { this.patientName = patientName; }

        public int getAge() { return age; }
        public void setAge(int age) { this.age = age; }

        public String getPhone() { return phone; }
        public void setPhone(String phone) { this.phone = phone; }

        public String getAddress() { return address; }
        public void setAddress(String address) { this.address = address; }

        public List<Long> getTestIds() { return testIds; }
        public void setTestIds(List<Long> testIds) { this.testIds = testIds; }

        public double getTestCost() { return testCost; }
        public void setTestCost(double testCost) { this.testCost = testCost; }

        public List<TestInfoDTO> getSelectedTests() { return selectedTests; }
        public void setSelectedTests(List<TestInfoDTO> selectedTests) { this.selectedTests = selectedTests; }
    }


