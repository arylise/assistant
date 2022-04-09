package com.assistant.service.intf;

import com.assistant.model.dto.DataList;
import com.assistant.model.enity.Doctor;

import java.util.List;

public interface DoctorService {

    String password(String username);

    int insertDocs(List<Doctor> doctorList);

    List<Doctor> selectAll();

    long count();

    boolean delete(String username);

    DataList findList(String redisName, String name);

    String getProject(String username);

    DataList checkQueue(String username);
}
