package com.emranhss.hospital.restController;


import com.emranhss.hospital.dto.MedicineDTO;
import com.emranhss.hospital.entity.Medicine;
import com.emranhss.hospital.service.MedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/medicine/")
public class MedicineRestController {

    @Autowired
    private MedicineService medicineService;

    @PostMapping("")
    public void save(@RequestBody Medicine medicine) {
        medicineService.save(medicine);
    }

    @GetMapping("")
    public List<MedicineDTO> getAll() {
        return medicineService.getAllMedicine();  // returns List<MedicineDTO>
    }

    @GetMapping("{id}")
    public Medicine getById(@PathVariable Long id) {

        return medicineService.getById(id).get();
    }

    @DeleteMapping("/{id}")
    public void deleteById(@PathVariable Long id) {

        medicineService.delete(id);
    }

//    @PutMapping("/{id}")
////    public void Update(@RequestBody Medicine medicine) {
////
////        medicineService.save(medicine);
////
////    }


@PutMapping("/{id}")
public Medicine update(@PathVariable Long id, @RequestBody Medicine medicine) {
    medicine.setId(id);
    return medicineService.save(medicine);
}


}
