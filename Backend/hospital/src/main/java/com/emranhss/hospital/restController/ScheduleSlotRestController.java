package com.emranhss.hospital.restController;

import com.emranhss.hospital.dto.SlotResponseDTO;
import com.emranhss.hospital.entity.ScheduleSlot;
import com.emranhss.hospital.service.ScheduleSlotService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/slot")
public class ScheduleSlotRestController {


    @Autowired
    private ScheduleSlotService scheduleSlotService;


//    @GetMapping
//    public ResponseEntity<List<ScheduleSlot>> getAllSlots() {
//        return ResponseEntity.ok(scheduleSlotService.getAllScheduleSlot());
//    }

    @GetMapping
    public ResponseEntity<List<SlotResponseDTO>> getAllSlots() {
        List<SlotResponseDTO> dtoList = scheduleSlotService.getAllSlots();
        return ResponseEntity.ok(dtoList);
    }




    @GetMapping("/doctor/{doctorId}")
    public ResponseEntity<List<SlotResponseDTO>> getSlotsByDoctor(@PathVariable Long doctorId) {
        List<SlotResponseDTO> slots = scheduleSlotService.getAllSlotsByDoctorId(doctorId);

        if (slots.isEmpty()) {
            return ResponseEntity.noContent().build();
        }

        return ResponseEntity.ok(slots);
    }


    @PostMapping("")
    public ScheduleSlot saveSlot(@RequestBody ScheduleSlot b,
                                 @RequestParam long doctor_id) {
        return scheduleSlotService.save(b, doctor_id);
    }



    @DeleteMapping("/{Id}")
    public ResponseEntity<String> deleteSlot(@PathVariable Long slotId) {
        scheduleSlotService.delete(slotId);
        return ResponseEntity.ok("Slot deleted successfully!");
    }

}
