package com.assistant.service.intf;

import com.assistant.model.dto.DataList;
import com.assistant.model.enity.Doctor;

import java.util.List;

public interface DoctorService {

    String password(String username);

    List<Doctor> selectAll();

    long count();

    DataList findList(String redisName, String name);

    String getProject();
}
