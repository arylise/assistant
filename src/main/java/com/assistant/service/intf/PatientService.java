package com.assistant.service.intf;

import com.assistant.model.enity.Patient;

import java.util.List;

public interface PatientService {
    String password(String username);

    boolean insertFast(String username, String password);

    long count();

    List<Patient> selectAll();

    boolean register(String dep, String username);

    List<String> getPath(String username, int weightPath, int weightTime);
}
