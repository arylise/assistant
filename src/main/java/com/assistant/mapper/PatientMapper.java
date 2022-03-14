package com.assistant.mapper;

import com.assistant.model.enity.Doctor;
import com.assistant.model.enity.Patient;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PatientMapper {
    String password(String username);

    boolean insert(String username, String password);

    int insertPats(List<Patient> patientList);

    long count();

    List<Patient> selectAll();
}
