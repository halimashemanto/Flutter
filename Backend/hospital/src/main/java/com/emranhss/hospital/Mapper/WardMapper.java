package com.emranhss.hospital.Mapper;

import com.emranhss.hospital.dto.BedDTO;
import com.emranhss.hospital.dto.FacilityDTO;
import com.emranhss.hospital.dto.WardDTO;
import com.emranhss.hospital.entity.Bed;
import com.emranhss.hospital.entity.Facility;
import com.emranhss.hospital.entity.Ward;
import org.springframework.stereotype.Component;

import java.util.stream.Collectors;


@Component
public class WardMapper {

    public static WardDTO toDTO(Ward ward) {
        WardDTO dto = new WardDTO();
        dto.setId(ward.getId());
        dto.setWardName(ward.getWardName());
        dto.setWardType(ward.getWardType());
        dto.setPricePerDay(ward.getPricePerDay());

//        if (ward.getBeds() != null) {
//            dto.setBeds(
//                    ward.getBeds().stream().map(WardMapper::toDTO).collect(Collectors.toList())
//            );
//        }
//
//        if (ward.getFacilities() != null) {
//            dto.setFacilities(
//                    ward.getFacilities().stream().map(WardMapper::toDTO ).collect(Collectors.toList())
//            );
//        }



        if (ward.getBeds() != null) {
            dto.setBeds(
                    ward.getBeds().stream()
                            .map(bed -> toDTO(bed)) // explicitly
                            .collect(Collectors.toList())
            );
        }

        if (ward.getFacilities() != null) {
            dto.setFacilities(
                    ward.getFacilities().stream()
                            .map(fac -> toDTO(fac)) // explicitly
                            .collect(Collectors.toList())
            );
        }

        return dto;
    }

    public static BedDTO toDTO(Bed bed) {
        BedDTO dto = new BedDTO();
        dto.setId(bed.getId());
        dto.setBedNumber(bed.getBedNumber());
        dto.setOccupied(bed.isOccupied());
        dto.setPricePerDay(bed.getPricePerDay());
        return dto;
    }

    public static FacilityDTO toDTO(Facility f) {
        FacilityDTO dto = new FacilityDTO();
        dto.setId(f.getId());
        dto.setName(f.getName());
        dto.setDescription(f.getDescription());
        dto.setAvailable(f.isAvailable());
        return dto;
    }
}
