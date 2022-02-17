package com.assistant.service.impl;

import com.assistant.mapper.PatientMapper;
import com.assistant.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PatientServiceImpl implements PatientService {
    @Autowired
    private PatientMapper patientMapper;

    @Override
    public String password(String username) {
        return patientMapper.password(username);
    }
}
