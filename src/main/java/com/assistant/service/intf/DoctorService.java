package com.assistant.service.intf;

import com.assistant.model.enity.Doctor;

import java.util.List;

public interface DoctorService {

    String password(String username);
    int insertDocs(List<Doctor> doctorList);
    List<Doctor> selectAllDocs();
    long count();
    boolean delete(String username);
}
