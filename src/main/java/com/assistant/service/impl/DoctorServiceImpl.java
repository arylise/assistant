package com.assistant.service.impl;

import com.assistant.mapper.DoctorMapper;
import com.assistant.model.enity.Doctor;
import com.assistant.service.intf.DoctorService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DoctorServiceImpl implements DoctorService {

    private final DoctorMapper doctorMapper;

    @Override
    public String password(String username) {
        return doctorMapper.password(username);
    }

    @Override
    public int insertDocs(List<Doctor> doctorList) {
        return doctorMapper.insertDocs(doctorList);
    }

    @Override
    public List<Doctor> selectAll() {
        return doctorMapper.selectAll();
    }

    @Override
    public long count() {
        return doctorMapper.count();
    }

    @Override
    public boolean delete(String username) {
        return doctorMapper.delete(username);
    }
}
