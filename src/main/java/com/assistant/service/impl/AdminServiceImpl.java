package com.assistant.service.impl;

import com.alibaba.fastjson.JSON;
import com.assistant.mapper.AdminMapper;
import com.assistant.model.dto.UserList;
import com.assistant.model.enity.Admin;
import com.assistant.model.enity.Doctor;
import com.assistant.model.enity.Patient;
import com.assistant.service.intf.AdminService;
import com.assistant.service.intf.DoctorService;
import com.assistant.service.intf.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private DoctorService doctorService;

    @Autowired
    private PatientService patientService;

    @Override
    public List<Admin> findAll() {
        return adminMapper.findAll();
    }

    @Override
    public String password(String username) {
        return adminMapper.password(username);
    }

    @Override
    public UserList doctorList() {
        List<Doctor> list = doctorService.selectAll();
        UserList<Doctor> users = new UserList<>();
        users.setData(list);
        users.setCode(0);
        users.setCount(doctorService.count());
        return users;
    }

    @Override
    public UserList patientList() {
        List<Patient> list = patientService.selectAll();
        UserList<Patient> users = new UserList<>();
        users.setData(list);
        users.setCode(0);
        users.setCount(patientService.count());
        return users;
    }


}
