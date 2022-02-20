package com.assistant.service.impl;

import com.assistant.mapper.DoctorMapper;
import com.assistant.model.enity.Doctor;
import com.assistant.service.intf.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoctorServiceImpl implements DoctorService {
    @Autowired
    private DoctorMapper doctorMapper;

    @Override
    public String password(String username) {
        return doctorMapper.password(username);
    }

    @Override
    public int insertDocs(List<Doctor> doctorList) {
        return doctorMapper.insertDocs(doctorList);
    }

    @Override
    public List<Doctor> selectAllDocs() {
        return doctorMapper.selectAllDocs();
    }

    @Override
    public long count() {
        return doctorMapper.count();
    }
}
