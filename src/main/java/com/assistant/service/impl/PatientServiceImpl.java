package com.assistant.service.impl;

import com.assistant.mapper.PatientMapper;
import com.assistant.service.intf.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class PatientServiceImpl implements PatientService {
    @Autowired
    private PatientMapper patientMapper;

    @Override
    public String password(String username) {
        return patientMapper.password(username);
    }

    @Override
    public boolean insertFast(String username, String password) {
        //md5加密
        password = new BCryptPasswordEncoder().encode(password);
        return patientMapper.insert(username, password);
    }
}
