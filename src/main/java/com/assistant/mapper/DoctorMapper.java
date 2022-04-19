package com.assistant.mapper;

import com.assistant.model.enity.Doctor;
import com.assistant.model.intf.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DoctorMapper extends BaseMapper {
    boolean delete(String username);

    String getDepartment(String username);

    List<String> getProject(String username);

    void update(Doctor doctor);
}
