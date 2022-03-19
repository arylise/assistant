package com.assistant.mapper;

import com.assistant.model.enity.Doctor;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface DoctorMapper {

    String password(String username);

    int insertDocs(List<Doctor> doctorList);

    List<Doctor> selectAll();

    long count();

    boolean delete(String username);

}
