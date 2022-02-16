package com.assistant.service.impl;

import com.assistant.mapper.DoctorMapper;
import com.assistant.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DoctorServiceImpl implements DoctorService {
    @Autowired
    private DoctorMapper doctorMapper;

    @Override
    public String password(String username) {
        return doctorMapper.password(username);
    }
}
