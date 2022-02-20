package com.assistant.mapper;

import com.assistant.model.enity.Doctor;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DoctorMapper {
    String password(String username);
    int insertDocs(List<Doctor> doctorList);
}
