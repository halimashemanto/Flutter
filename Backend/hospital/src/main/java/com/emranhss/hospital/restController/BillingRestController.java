package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.ItemizedBillDTO;
import com.emranhss.hospital.service.BillingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/billing")
public class BillingRestController {

    @Autowired
    private BillingService billingService;

    @GetMapping("/itemized/{bedBookingId}")
    public ResponseEntity<Map<String, Object>> getItemizedBill(@PathVariable Long bedBookingId) {
        List<ItemizedBillDTO> items = billingService.getItemizedBill(bedBookingId);
        double total = billingService.getTotalAmount(items);

        Map<String, Object> response = new HashMap<>();
        response.put("items", items);
        response.put("total", total);

        return ResponseEntity.ok(response);
    }





}
